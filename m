From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 0/3] LED interface for PowerNV platform
Date: Thu, 11 Jun 2015 12:03:23 +0530
Message-ID: <55792BB3.3000102@linux.vnet.ibm.com>
References: <20150428100535.26912.29607.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:52452 "EHLO
	e23smtp05.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036AbbFKGeV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 11 Jun 2015 02:34:21 -0400
Received: from /spool/local
	by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-leds@vger.kernel.org> from <hegdevasant@linux.vnet.ibm.com>;
	Thu, 11 Jun 2015 16:34:19 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 41EA42BB0047
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2015 16:34:15 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id t5B6Y5iJ46661882
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2015 16:34:13 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id t5B6Xf3C009885
	for <linux-leds@vger.kernel.org>; Thu, 11 Jun 2015 16:33:42 +1000
In-Reply-To: <20150428100535.26912.29607.stgit@localhost.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, mpe@ellerman.id.au
Cc: stewart@linux.vnet.ibm.com, j.anaszewski81@gmail.com, cooloney@gmail.com, rpurdie@rpsys.net, khandual@linux.vnet.ibm.com

On 04/28/2015 03:39 PM, Vasant Hegde wrote:
> The following series implements LED driver for PowerNV platform.

Ben, Michael,

Can you please review/ACK this patchset?

-Vasant

>=20
> PowerNV platform has below type of LEDs:
>   - System attention
>       Indicates there is a problem with the system that needs attenti=
on.
>   - Identify
>       Helps the user locate/identify a particular FRU or resource in =
the
>       system.
>   - Fault
>       Indicates there is a problem with the FRU or resource at the
>       location with which the indicator is associated.
>=20
> On PowerNV (Non Virtualized) platform OPAL firmware provides LED info=
rmation
> to host via device tree (location code and LED type). During init we =
check
> for 'ibm,opal/led' node in device tree to enable LED driver. And we u=
se
> OPAL API's to get/set LEDs.
>=20
> Note that on PowerNV platform firmware can activate fault LED, if it =
can isolate
> the problem. Also one can modify the LEDs using service processor int=
erface. None
> of these involes kernel. Hence we retain LED state in unload path.
>=20
> Sample LED device tree output:
> ------------------------------
> led {
> 	compatible =3D "ibm,opal-v3-led";
> 	phandle =3D <0x1000006b>;
> 	linux,phandle =3D <0x1000006b>;
> 	led-mode =3D "lightpath";
>=20
> 	U78C9.001.RST0027-P1-C1 {
> 		led-types =3D "identify", "fault";
> 		led-loc =3D "descendent";
> 		phandle =3D <0x1000006f>;
> 		linux,phandle =3D <0x1000006f>;
> 	};
> 	...
> 	...
>     }
>=20
> Sample sysfs output:
> --------------------
> .
> =E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:fault
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 brightness
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../opal_led
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_brightness
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 async
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 autosuspend_delay=
_ms
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_active_ki=
ds
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_active_ti=
me
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_enabled
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_status
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_suspended=
_time
> =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 runtime_usage
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../c=
lass/leds
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 trigger
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
> =E2=94=9C=E2=94=80=E2=94=80 U78CB.001.WZS008R-A1:identify
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 brightness
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 device -> ../../../opal_led
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_brightness
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 async
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 autosuspend_delay=
_ms
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 control
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_active_ki=
ds
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_active_ti=
me
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_enabled
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_status
> =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 runtime_suspended=
_time
> =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 runtime_usage
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../c=
lass/leds
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 trigger
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
> ....
> ....
> ....
>=20
> patch 1/2: PowerNV architecture specific code. This adds necessary
>            OPAL APIs.
> patch 2/2: Create LED platform device and export OPAL symbols
> patch 3/3: Actual LED driver implemenation for PowerNV platform.
>=20
> This patchset is based on top of mpe's next branch:
>   https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=3D=
next
>=20
> Previous patchset:
>   v3: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-April/1277=
02.html
>   v2: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/1263=
01.html
>   v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2015-March/1257=
05.html
>=20
> Changes in v4:
>   - Updated macros to reflect platform.
>   - s/u64/__be64/g for big endian data we get from firmware
>   - Addressed review comments from Jacek. Major once are:
>     Removed list in powernv_led_data structure
>     s/kzalloc/devm_kzalloc/
>     Removed compatible property from documentation
>     s/powernv_led_set_queue/powernv_brightness_set/
>   - Removed LED specific brightness_set/get function. Instead this ve=
rsion
>     uses single function to queue all LED set/get requests. Later we =
use
>     LED name to detect LED type and value.
>   - Removed hardcoded LED type used in previous version. Instead we u=
se
>     led-types property to form LED classdev.
>=20
> Changes in v3:
>   - Addressed review comments from Jacek. Major once are:
>     Replaced spin lock and mutex and removed redundant structures
>     Replaced pr_* with dev_*
>     Moved OPAL platform sepcific part to separate patch
>     Moved repteated code to common function
>     Added device tree documentation for LEDs
>=20
> Changes in v2:
>   - Rebased patches on top of mpe's next branch
>     https://git.kernel.org/cgit/linux/kernel/git/mpe/linux.git/log/?h=
=3Dnext
>   - Added System Attention Indicator support
>   - Removed redundant code in leds-powernv.c file
>=20
>=20
> ---
>=20
> Anshuman Khandual (1):
>       powerpc/powernv: Add OPAL interfaces for accessing and modifyin=
g system LED states
>=20
> Vasant Hegde (2):
>       powerpc/powernv: Create LED platform device
>       leds/powernv: Add driver for PowerNV platform
>=20
>=20
>  .../devicetree/bindings/leds/leds-powernv.txt      |   29 +
>  arch/powerpc/include/asm/opal-api.h                |   29 +
>  arch/powerpc/include/asm/opal.h                    |    5=20
>  arch/powerpc/platforms/powernv/opal-wrappers.S     |    2=20
>  arch/powerpc/platforms/powernv/opal.c              |   12 -
>  drivers/leds/Kconfig                               |   11=20
>  drivers/leds/Makefile                              |    1=20
>  drivers/leds/leds-powernv.c                        |  472 ++++++++++=
++++++++++
>  8 files changed, 559 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-power=
nv.txt
>  create mode 100644 drivers/leds/leds-powernv.c
>=20
> --
> Vasant
>=20
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
>=20
