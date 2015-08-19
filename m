From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: [PATCH v10 0/3] LED driver for PowerNV platform
Date: Wed, 19 Aug 2015 22:19:51 +0530
Message-ID: <1440002994-25662-1-git-send-email-hegdevasant@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:54700 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199AbbHSQuJ (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 12:50:09 -0400
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Wed, 19 Aug 2015 22:20:06 +0530
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id C1BBF3940061
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:20:03 +0530 (IST)
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay02.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t7JGo1gT53215406
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:20:01 +0530
Received: from d28av01.in.ibm.com (localhost [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t7JGnx2H005271
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2015 22:20:01 +0530
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, j.anaszewski@samsung.com, stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, arnd@arndb.de, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com, benh@kernel.crashing.org, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

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
 - This version of patchset is based on top of v4.2-rc7.

@Ben/Michael,
  This patchset is Acked by LED subsystem maintainer (Jacek) [1] and he
  suggested merge it via powerpc tree [1]. Can you please review/take
  this patchset?

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-July/131695.ht=
ml

Previous patchset:
  v9: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-August/13296=
4.html
  v8: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-July/131652.=
html
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

Changes in v10:
  - Removed "led_disabled" variable initialization
  - Removed ".owner =3D THIS_MODULE"

Changes in v9:
  - Addressed minor comments from Jacek.
  - Added Ack-by: Jacek

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
 drivers/leds/leds-powernv.c                        | 345 +++++++++++++=
++++++++
 8 files changed, 424 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-powernv=
=2Etxt
 create mode 100644 drivers/leds/leds-powernv.c

--=20
Vasant
2.1.0
