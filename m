From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: leds-gpio on x86
Date: Wed, 5 Aug 2015 22:09:48 +0200
Message-ID: <20150805220948.3984f19c@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:38679 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751542AbbHEUJZ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2015 16:09:25 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

Hello,

I have recently acquired a NAS[1] which is basically an x86_64 with UEFI
bios and adequate enclosure (drive trays and associated activity & error
leds).

Not being too happy with stock firmware features, I am in the process
of replacing it with a general distribution. The distribution works
great with stock kernel, but I do not get the error leds (nor, but I'm
less interested, the global power/error/usb leds).

Poking in the original firmware, I found a file declaring which SuperIO
GPIO pins are used, and confirmed they do work by loading the
appropriate gpio driver.

Now, I wonder how far I should go: I would like to use the leds
subsystem for easy triggering, but leds-acpi finds nothing.
A quick read shows this driver finds relevant devices using
openfirmware enumeration functions. If I understand correctly, this
would be devicetree on ARM/MIPS/... but ACPI tables on x86. After an
uneducated look at disassembled DSDT, I think I found the
SuperIO declaration:
  Name (IO3B, 0x0290)
  [...]
  Device (SIO1)
  {
    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
    [...]
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
      [...]
      If (IO3B)
      {
        CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y0A._MIN, GP30)  // _MIN: Minimum Base Address
        CreateWordField (CRS, \_SB.PCI0.SBRG.SIO1._Y0A._MAX, GP31)  // _MAX: Maximum Base Address
        CreateByteField (CRS, \_SB.PCI0.SBRG.SIO1._Y0A._LEN, GPL3)  // _LEN: Length
        GP30 = IO3B /* \IO3B */
        GP31 = IO3B /* \IO3B */
        GPL3 = IO3L /* \IO3L */
      }
(dmesg showing the SuperIO being based at 0x290 and this value not
appearing elsewhere) which does not define any GPIO (no GpioIo() in
the Device {} block), even less leds.

One option seems to patch this to declare leds, but it seems dangerous
(from the examples[2] I found, the change needed is less than 100 lines
for the 6 leds, but that's an awful lot of error possibilities for the
ACPI illiterate I am).

Another option seems to develop a dumb module just declaring what the
leds. This means I'll have to maintain an off-tree module (I do not
see how it would detect that it's actually on this NAS model, so
upstream inclusion seems unlikely).

Yet another option would be to extend an existing driver, to make it
configurable (ex: via sysfs). This would be my favourite (it is
clearer to see how it would get merged), but registration need several
values (name, pin number, active high/low, maybe color ?) and I have no
idea how clean the syntax would be.

Everything seems possible but I cannot tell which has better chances of
success.

Is my analysis correct so far ?
Which next step would you recommend ?

[1] QNAP TS-651
[2] https://lwn.net/Articles/612062/
-- 
Vincent Pelletier
