/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT.aml, Wed Feb  3 14:31:48 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000010B (267)
 *     Revision         0x01
 *     Checksum         0x5D
 *     OEM ID           "APPLE "
 *     OEM Table ID     "SataAhci"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140424 (538182692)
 */
DefinitionBlock ("", "SSDT", 1, "APPLE ", "SataAhci", 0x00001000)
{
    External (_SB_.PCI0.RP06.SSD0, DeviceObj)
    External (GTF0, FieldUnitObj)

    Scope (\_SB.PCI0.RP06.SSD0)
    {
        Device (PRT0)
        {
            Name (_ADR, 0xFFFF)  // _ADR: Address
            Method (_SDD, 1, NotSerialized)  // _SDD: Set Device Data
            {
                Name (GBU0, Buffer (0x07)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00         // .......
                })
                CreateByteField (GBU0, 0x00, GB00)
                CreateByteField (GBU0, 0x01, GB01)
                CreateByteField (GBU0, 0x02, GB02)
                CreateByteField (GBU0, 0x03, GB03)
                CreateByteField (GBU0, 0x04, GB04)
                CreateByteField (GBU0, 0x05, GB05)
                CreateByteField (GBU0, 0x06, GB06)
                If ((SizeOf (Arg0) == 0x0200))
                {
                    CreateWordField (Arg0, 0x9C, W780)
                    If ((W780 & 0x08))
                    {
                        GB00 = 0x10
                        GB01 = 0x03
                        GB06 = 0xEF
                    }
                    Else
                    {
                        GB00 = 0x90
                        GB01 = 0x03
                        GB06 = 0xEF
                    }
                }

                GTF0 = GBU0 /* \_SB_.PCI0.RP06.SSD0.PRT0._SDD.GBU0 */
            }

            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                Return (GTF0) /* \GTF0 */
            }
        }
    }
}
