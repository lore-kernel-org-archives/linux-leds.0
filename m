From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: Re: leds-gpio on x86
Date: Sat, 15 Aug 2015 12:36:40 +0200
Message-ID: <20150815123640.45a5b9bf@x2>
References: <20150805220948.3984f19c@x2>
	<20150806165924.GY1540@lahna.fi.intel.com>
	<20150806191727.0bf87a3a@x2>
	<20150806173558.GZ1540@lahna.fi.intel.com>
	<20150806201820.5ca0764d@x2>
	<20150807105745.GB1540@lahna.fi.intel.com>
	<20150808140656.6b81d3b9@x2>
	<20150811120038.GF1541@lahna.fi.intel.com>
	<20150811194256.08816c63@x2>
	<20150812125314.GS1541@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:34206 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbbHOKgo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 15 Aug 2015 06:36:44 -0400
In-Reply-To: <20150812125314.GS1541@lahna.fi.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org

On Wed, 12 Aug 2015 15:53:14 +0300, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Once your module gets loaded, it creates the "leds-gpio" platform device
> which in turn makes the leds-gpio driver to load.

Oh, right, I somehow thought I had to modprobe it too and didn't check
without. It does work.

> For gpio-f7188x you need to load it manually because it does not have
> any module strings modprobe can match with a device. You can create
> platform device for this in your qnap board file as well and then add
> MODULE_ALIAS() to the driver to get it loaded automatically.

Looking at MODULE_ALIAS, I found "request_module()". It works great.

I've also added declaration for both buttons, and moved my code to
drivers/platform/x86/ as it is no longer leds-specific. I found that
there are things like laptop-[brand-]specific modules there, so I guess
it is reasonable.

> > - Somehow detect that it is actually a qnap of expected model (and, by
> >   extension, actually implement led count substraction).
> >   I tried (and failed so far) to understand what the original firmware
> >   does. dmidecode does not bring something relevant. I have no idea
> >   what is typically done in this area.
> 
> Typically we get necessary information from ACPI or similar device
> description ;-)

Right :) .

> You may check DMI strings in _init() of your board file and only create
> the platform devices if they match qnap. /sys/class/dmi/id/* should have
> something to differentiate it from others.

Sadly, ACPI-careless OEM is DMI-careless too:

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
        Vendor: American Megatrends Inc.
        Version: 5.6.5
        Release Date: 05/19/2014
        Address: 0xF0000
        Runtime Size: 64 kB
        ROM Size: 1024 kB
        Characteristics:
                PCI is supported
                BIOS is upgradeable
                BIOS shadowing is allowed
                Boot from CD is supported
                Selectable boot is supported
                BIOS ROM is socketed
                EDD is supported
                5.25"/1.2 MB floppy services are supported (int 13h)
                3.5"/720 kB floppy services are supported (int 13h)
                3.5"/2.88 MB floppy services are supported (int 13h)
                Print screen service is supported (int 5h)
                8042 keyboard services are supported (int 9h)
                Serial services are supported (int 14h)
                Printer services are supported (int 17h)
                ACPI is supported
                USB legacy is supported
                BIOS boot specification is supported
                Targeted content distribution is supported
                UEFI is supported
        BIOS Revision: 5.6

Handle 0x0001, DMI type 1, 27 bytes
System Information
        Manufacturer: To be filled by O.E.M.
        Product Name: To be filled by O.E.M.
        Version: To be filled by O.E.M.
        Serial Number: To be filled by O.E.M.
        UUID: 03000200-0400-0500-0006-000700080009
        Wake-up Type: Power Switch
        SKU Number: To be filled by O.E.M.
        Family: To be filled by O.E.M.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: AMI Corporation
        Product Name: Aptio CRB
        Version: To be filled by O.E.M.
        Serial Number: To be filled by O.E.M.
        Asset Tag: To be filled by O.E.M.
        Features:
                Board is a hosting board
                Board is replaceable
        Location In Chassis: To be filled by O.E.M.
        Chassis Handle: 0x0003
        Type: Motherboard
        Contained Object Handles: 0

Handle 0x0003, DMI type 3, 25 bytes
Chassis Information
        Manufacturer: To Be Filled By O.E.M.
        Type: Desktop
        Lock: Not Present
        Version: To Be Filled By O.E.M.
        Serial Number: To Be Filled By O.E.M.
        Asset Tag: To Be Filled By O.E.M.
        Boot-up State: Safe
        Power Supply State: Safe
        Thermal State: Safe
        Security Status: None
        OEM Information: 0x00000000
        Height: Unspecified
        Number Of Power Cords: 1
        Contained Elements: 1
                <OUT OF SPEC> (0)
        SKU Number: To be filled by O.E.M.

BIOS block values look nice, but not specific enough.
"Aptio CRB" seems to be an AMI trademark for their UEFI bios.
UUID looks garbage (or rather, it looks too clean to be relevant).

So I guess /etc/modules is the way.

I think the module is now quite close to submission for broader
review, thanks to your help.

Regards,
-- 
Vincent Pelletier
