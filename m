From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v8 0/3] LED driver for PowerNV platform
Date: Sat, 25 Jul 2015 10:51:07 +0530
Message-ID: <1437801670-23705-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:51194 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbbGYFWT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 25 Jul 2015 01:22:19 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Sat, 25 Jul 2015 15:22:17 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 59122357804F
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2015 15:22:13 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t6P5M1X634799616
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2015 15:22:09 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t6P5Lenn017441
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2015 15:21:41 +1000
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, j.anaszewski@samsung.com
Cc: rpurdie@rpsys.net, cooloney@gmail.com, khandual@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, stewart@linux.vnet.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

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
for 'ibm,opal/leds' node in device tree to enable LED driver. And we us=
e
OPAL API's to get/set LEDs.

Note that on PowerNV platform firmware can activate fault LED, if it ca=
n isolate
the problem. Also one can modify the LEDs using service processor inter=
face. None
of these involes kernel. Hence we retain LED state in unload path.

Sample LED device tree output:
------------------------------
leds {
	compatible =3D "ibm,opal-v3-led";
	led-mode =3D "lightpath";

	U78C9.001.RST0027-P1-C1 {
		led-types =3D "identify", "fault";
	};
	...
	...
    }

Sample sysfs output:
--------------------
=2E
=E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:fault
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../op=
al_leds
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
=E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:identify
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 brightness
=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../op=
al_leds
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

Note:
 - This patchset depends on Jacek's patchset
   https://lkml.org/lkml/2015/7/17/151 (Remove work queues from LED cla=
ss drivers)
 - This version of patchset is based on top of v4.2-rc2.

Previous patchset:
  v7: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-July/131533.=
html
  v6: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-July/131328.=
html
  v5: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-July/130602.=
html
  v4: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-April/128028=
=2Ehtml
  v3: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-April/127702=
=2Ehtml
  v2: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/126301=
=2Ehtml
  v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/125705=
=2Ehtml

Changes in v8:
  - Added powernv_led_common structure for common variables
  - Removed unused variable 'value'
  - Fixed locking issue

Changes in v7:
  - Club powernv_led_data & powernv_leds_priv into single structure
  - Removed num_leds & powernv_leds_count()
  - Replaced per LED mutex with global mutex
  - Removed driver specific workqueue. Instead this version uses new
    global workqueue.

Changes in v6:
  - Added loc_code and type to powernv_led_data structure instead of pa=
rsing
    them from led classdev name.
  - Fixed documentation issues.
  - Fixed mutex_destry issue
  - Replaced led_classdev_register with devm_led_classdev_register

Changes in v5:
  - Rebased on top of Linus tree
  - Renamed led as leds and updated documentation
  - As Ben and Arnd suggested, removed phandle from documenation
  - As Ben suggested removed led-loc device tree property
  - As Jacek suggested, added back compatible property to documentation

Changes in v4:
  - Updated macros to reflect platform.
  - s/u64/__be64/g for big endian data we get from firmware
  - Addressed review comments from Jacek. Major once are:
    Removed list in powernv_led_data structure
    s/kzalloc/devm_kzalloc/
    Removed compatible property from documentation
    s/powernv_led_set_queue/powernv_brightness_set/
  - Removed LED specific brightness_set/get function. Instead this vers=
ion
    uses single function to queue all LED set/get requests. Later we us=
e
    LED name to detect LED type and value.
  - Removed hardcoded LED type used in previous version. Instead we use
    led-types property to form LED classdev.

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


Anshuman Khandual (1):
  powerpc/powernv: Add OPAL interfaces for accessing and modifying
    system LED states

Vasant Hegde (2):
  powerpc/powernv: Create LED platform device
  leds/powernv: Add driver for PowerNV platform

 .../devicetree/bindings/leds/leds-powernv.txt      |  26 ++
 arch/powerpc/include/asm/opal-api.h                |  25 +-
 arch/powerpc/include/asm/opal.h                    |   4 +
 arch/powerpc/platforms/powernv/opal-wrappers.S     |   2 +
 arch/powerpc/platforms/powernv/opal.c              |  12 +-
 drivers/leds/Kconfig                               |  11 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-powernv.c                        | 350 +++++++++++++=
++++++++
 8 files changed, 429 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-powernv=
=2Etxt
 create mode 100644 drivers/leds/leds-powernv.c

--=20
2.1.0
