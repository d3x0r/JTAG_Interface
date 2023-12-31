//
// This is an example on how to use the JTAG_Interface: The file FPGA_Bitstream.h is
// generated from Intel Quartus and supposed to be replaced by your own. Make sure to
// take a look at the attached Quartus project, where you can extend this project or copy
// the Verilog modules related to the JTAG interface and paste them into your own design.
//
// Those files allow you to easily and reliably send and read data from and to the FPGA. 
// The goal of this project is to make it as easy as possible for any new user to establish 
// a communication between the CPU and the FPGA in a custom bitstream, as most commonly 
// the first problem you encounter when creating your own bitstream is that you lose the 
// ability to talk to the FPGA.
//
// When replacing this bitstream with your own, make sure to compile it correctly with Intel Quartus
//  (try the attached Quartus project which the default bitstream is generated from).
//
// When successfully compiled, take the output file ( output_files/MKRVIDOR4000.ttf ) and
// bit-reverse it using the ByteReverser:
//
//      https://github.com/HerrNamenlos123/bytereverse
// 

#include "FPGA.h"

void setup() {

	Serial.begin(115200);	// Wait for serial monitor to open
	while(!Serial);

	// Next, upload the FPGA bitstream and initialize the JTAG_Interface (takes a sec)
	// You must specify the register bit width and the number of registers.

	if (!FPGA.begin(32, 15)) {							// You should always check this
		Serial.println("JTAG FPGA mismatch. Error:");
		Serial.println(FPGA.getErrorMessage());
		while (true);
	}

	Serial.println("JTAG initialized");

}

uint32_t ticks2low_ = 0;
uint32_t ticks2_ = 0;
uint32_t ticks3low_ = 0;
uint32_t ticks3_ = 0;
uint32_t last_millis = 0;
uint32_t reset_millis;
uint32_t reset = 0;

void readFPGA();
void readSerial();
void readFPGALive();

void loop() {
  readSerial();
  readFPGALive();
  readFPGA();
}

void readSerial() {

  while (Serial.available() > 0) {
    // read the incoming byte:
    int incomingByte = Serial.read();
    FPGA.write( 9, incomingByte );
    // reset |= incomingByte & 0xC;
    // say what you got:
    Serial.print(millis());
    Serial.print(":I received: ");
    //Serial.print(millis())
    Serial.println(incomingByte, DEC);
  }

}


void readFPGALive() {
    static union {
      unsigned char buf[8];
      struct {
        uint32_t clkhi;
        uint32_t clk;
      }data;
    } buf;
	uint8_t pins = FPGA.read(13);
  if( !( pins & 1 ) & ( reset & 1 ) )
    reset &= ~1;
  if( !(reset & 1) && ( pins & 1 )  ) {    
    buf.data.clk = FPGA.read( 9 );
    buf.data.clkhi = FPGA.read( 10 );
    Serial.write( (char)0 );
    for( int i = 0; i < 8; i++ )
      Serial.write( buf.buf[i] );
    reset |= 1;
  } 
  if( !( pins & 2 ) & ( reset & 2 ) )
    reset &= ~2;
  if( !(reset & 2) && ( pins & 2 )  ) {    
    buf.data.clk = FPGA.read( 11 );
    buf.data.clkhi = FPGA.read( 12 );
    Serial.write( (char)1 );
    for( int i = 0; i < 8; i++ )
      Serial.write( buf.buf[i] );
    reset |= 2;
  } 
}

void readFPGA() {
  uint32_t m;
  if( (m=millis()) - last_millis > 50 ) {
    last_millis = m;


    // Bits 0, 1 & 2 of output register 0 are connected to 
    // outputs D6, D7 and D8 on the FPGA (see MKRVIDOR4000_top.v)
    FPGA.write(0, 0b111);

    // WARNING: DO NOT SET D6, D7 OR D8 AS AN OUTPUT HERE!
    // When pins are configured as outputs on the CPU and the
    // FPGA at the same time, your board will be damaged!

    // Bits 0, 1 & 2 of input register 0 are connected to digital
    // inputs A0, A1 & A2 on the FPGA (see MKRVIDOR4000_top.v)


    uint8_t pins = FPGA.read(0);
    Serial.print(millis());
    Serial.print(":A0 = "); Serial.println(pins & 0b001 > 0);
    Serial.print("A1 = "); Serial.println(pins & 0b010 > 0);
    Serial.print("A2 = "); Serial.println(pins & 0b100 > 0);
    Serial.println();

    // On the FPGA, a counter is connected to input 9
    uint32_t ticks = FPGA.read(7);
    uint32_t debug = FPGA.read(8);
    uint32_t ticks2_low = FPGA.read(9);
    uint32_t ticks2 = FPGA.read(10);
    uint32_t ticks3_low = FPGA.read(11);
    uint32_t ticks3 = FPGA.read(12);
    uint8_t pins2 = FPGA.read(13);
  
    Serial.print(millis());
    Serial.print(":The FPGA program has been running for ");
    Serial.print(debug, HEX);
    Serial.print(" pins:");
    Serial.print(pins2);
    Serial.print(" tl2d:");
    Serial.print(ticks2_low, HEX);
    Serial.print(" t2:");
    Serial.print(ticks2, HEX);
    Serial.print(" tl3d:");
    Serial.print(ticks3_low, HEX);
    Serial.print(" t3:");
    Serial.print(ticks3, HEX);

    ticks2low_ = ticks2_low;
    ticks2_ = ticks2;
    ticks3low_ = ticks3_low;
    ticks3_ = ticks3;
    Serial.print(" ticks, that is ");
    Serial.print(ticks / 120000000.0);
    Serial.println(" seconds.");

    //0.000 000 017 8
    //0.000 000 003.89

    // When the data type is not an int, you can use FPGA.toByte<>() and FPGA.fromByte<>()
    // It converts your non-int data to an int64_t and transmits it. Your data can only be 64 bit max.
    //FPGA.write(5, FPGA.toBytes<float>(18.7f));		// Writing a 32-bit float
    
    // This function reads the bytes and then converts it to your 64-bit double.
    // WARNING: To do this, you must set the register size to 64 bits in your FPGA and in FPGA.begin()

    //double value = FPGA.fromBytes<double>(FPGA.read(3));


      // This functions writes the variable to register 7 while simultaneously
      // reading from register 3. This function is the most efficient for data throughput,
      // so make sure to use it when you need to read and write at the same time. It takes
      // just as long as the other functions.
      //uint32_t write = 5;
      //uint32_t read = FPGA.transfer(3, 7, write);
  }
	//delay(5);

}

