From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v3 0/3] LED interface for PowerNV platform
Date: Mon, 20 Apr 2015 13:29:22 +0530
Message-ID: <20150420075558.12371.6697.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([122.248.162.6]:45797 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752641AbbDTH7a (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 03:59:30 -0400
Received: from /spool/local
	by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Mon, 20 Apr 2015 13:29:27 +0530
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 370F41258059
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:31:21 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t3K7xNdr31654030
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:29:24 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t3K7aPZ4025725
	for <linux-leds@vger.kernel.org>; Mon, 20 Apr 2015 13:06:26 +0530
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Cc: stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, cooloney@gmail.com, rpurdie@rpsys.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>, j.anaszewski@samsung.com, khandual@linux.vnet.ibm.com

The following series implements LED driver for PowerNV platform.

PowerNV platform has below type of LEDs:
  - System attention
      Indicates there is a problem with the system that needs attention=
=2E
  - Identify
      Helps the user locate/identify a particular FRU or resource in th=
e
      system.
  - Fault
      Indicates there is a problem with the FRU or resource at the
      location with which the indicator is associated.

On PowerNV (Non Virtualized) platform OPAL firmware provides LED inform=
ation
to host via device tree (location code and LED type). During init we ch=
eck
for 'ibm,opal/led' node in device tree to enable LED driver. And we use
OPAL API's to get/set LEDs.

Note that on PowerNV platform firmware can activate fault LED, if it ca=
n isolate
the problem. Also one can modify the LEDs using service processor inter=
face. None
of these involes kernel. Hence we retain LED state in unload path.

Sample LED device tree output:
------------------------------
led {
	compatible =3D "ibm,opal-v3-led";
	phandle =3D <0x1000006b>;
	linux,phandle =3D <0x1000006b>;
	led-mode =3D "lightpath";

	U78C9.001.RST0027-P1-C1 {
		led-types =3D "identify", "fault";
		led-loc =3D "descendent";
		phandle =3D <0x1000006f>;
		linux,phandle =3D <0x1000006f>;
	};
	...
	...
    }

Sample sysfs output:
--------------------
=2E
=E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:FAULT
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../op=
al_led
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 max_brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 power
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 async
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 autosuspend_delay_ms
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 control
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_active_kids
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_active_time
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_enabled
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_status
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_suspended_time
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 runtime_usage
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../..=
/../../class/leds
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 trigger
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 uevent
=E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:IDENT
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../op=
al_led
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 max_brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 power
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 async
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 autosuspend_delay_ms
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 control
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_active_kids
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_active_time
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_enabled
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_status
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 runtime_suspended_time
=E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 runtime_usage
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../..=
/../../class/leds
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 trigger
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 uevent
=2E...
=2E...
=2E...


patch 1/2: PowerNV architecture specific code. This adds necessary
           OPAL APIs.
patch 2/2: Create LED platform device and export OPAL symbols
patch 3/3: Actual LED driver implemenation for PowerNV platform.

This patchset is based on top of mpe's next branch:
  https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=3Dn=
ext

Previous patchset:
  v2: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/126301=
=2Ehtml
  v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/125705=
=2Ehtml

Changes in v3:
  - Addressed review comments from Jacek. Major once are:
    Replaced spin lock and mutex and removed redundant structures
    Replaced pr_* with dev_*
    Moved OPAL platform sepcific part to separate patch
    Moved repteated code to common function
    Added device tree documentation for LEDs

Changes in v2:
  - Rebased patches on top of mpe's next branch
    https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=3D=
next
  - Added System Attention Indicator support
  - Removed redundant code in leds-powernv.c file


---

Anshuman Khandual (1):
      powerpc/powernv: Add OPAL interfaces for accessing and modifying =
system LED states

Vasant Hegde (2):
      powerpc/powernv: Create LED platform device
      leds/powernv: Add driver for PowerNV platform


 .../devicetree/bindings/leds/leds-powernv.txt      |   34 +
 arch/powerpc/include/asm/opal-api.h                |   29 +
 arch/powerpc/include/asm/opal.h                    |    5=20
 arch/powerpc/platforms/powernv/opal-wrappers.S     |    2=20
 arch/powerpc/platforms/powernv/opal.c              |   12 -
 drivers/leds/Kconfig                               |   11=20
 drivers/leds/Makefile                              |    1=20
 drivers/leds/leds-powernv.c                        |  455 ++++++++++++=
++++++++
 8 files changed, 547 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-powernv=
=2Etxt
 create mode 100644 drivers/leds/leds-powernv.c

--
Vasant
