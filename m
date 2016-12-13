From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 4/5] firmware: add SmPL report for custom fallback mechanism
Date: Tue, 13 Dec 2016 10:44:22 +0100
Message-ID: <10f8c7f7-a255-4830-65f0-a040d8236bf1@samsung.com>
References: <20161213030828.17820-1-mcgrof@kernel.org>
 <CGME20161213030855epcas2p154c4db65f0d1e5b0c47979dc8500517d@epcas2p1.samsung.com>
 <20161213030828.17820-5-mcgrof@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56191 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932511AbcLMJod (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Dec 2016 04:44:33 -0500
In-reply-to: <20161213030828.17820-5-mcgrof@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: woogyom.kim@gmail.com
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, gregkh@linuxfoundation.org, ming.lei@canonical.com, daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, linux-leds@vger.k

Hi Milo,

Could you please verify if leds-lp55xx-common.c driver
really needs a custom firmware loading fallback mechanism?
See [0] to gain some background knowledge, especially patch 3/5 seems
to provide a big amount of information.

[0] https://lkml.org/lkml/2016/12/12/717

Thanks,
Jacek Anaszewski

On 12/13/2016 04:08 AM, Luis R. Rodriguez wrote:
> Even though most distributions today disable the fallback mechanism
> by default we've determined that we cannot remove them from the kernel.
> This is not well understood so document the reason and logic behind that.
>
> Recent discussions suggest some future userspace development prospects which
> may enable fallback mechanisms to become more useful while avoiding some
> historical issues. These discussions have made it clear though that there
> is less value to the custom fallback mechanism and an alternative can be
> provided in the future. Its also clear that some old users of the custom
> fallback mechanism were using it as a copy and paste error. Because of
> all this add a Coccinelle SmPL patch to help maintainers police for new
> incorrect users of the custom fallback mechanism.
>
> Best we can do for now then is police for new users of the custom
> fallback mechanism and and fix incorrect users when they are spotted.
> Drivers can only be transitioned out of the custom fallback mechanism
> once we know old userspace cannot be not be broken by a kernel change.
>
> The current SmPL patch reports:
>
> $ export COCCI=scripts/coccinelle/api/request_firmware-custom-fallback.cocci
> $ make coccicheck MODE=report
>
> drivers/leds/leds-lp55xx-common.c:227:8-31: WARNING: please check if driver really needs a custom fallback mechanism
> drivers/firmware/dell_rbu.c:622:17-40: WARNING: please check if driver really needs a custom fallback mechanism
>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> Cc: Abhay Salunke <Abhay_Salunke@dell.com>
> Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
> ---
>  .../driver-api/firmware/fallback-mechanisms.rst    | 17 ++++++++++
>  .../api/request_firmware-custom-fallback.cocci     | 37 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 scripts/coccinelle/api/request_firmware-custom-fallback.cocci
>
> diff --git a/Documentation/driver-api/firmware/fallback-mechanisms.rst b/Documentation/driver-api/firmware/fallback-mechanisms.rst
> index edce1d76ce29..955c11d6ff9d 100644
> --- a/Documentation/driver-api/firmware/fallback-mechanisms.rst
> +++ b/Documentation/driver-api/firmware/fallback-mechanisms.rst
> @@ -28,6 +28,12 @@ CONFIG_FW_LOADER_USER_HELPER_FALLBACK=n
>  the kobject uevent fallback mechanism will never take effect even
>  for request_firmware_nowait() when uevent is set to true.
>
> +Although the fallback mechanisms are not used widely today they cannot be
> +removed from the kernel since some old userspace may exist which could
> +entirely depend on the fallback mechanism enabled with the kernel config option
> +CONFIG_FW_LOADER_USER_HELPER_FALLBACK. In the future though drivers may opt
> +to embrace a different API which provides alternative fallback mechanisms.
> +
>  Justifying the firmware fallback mechanism
>  ==========================================
>
> @@ -176,6 +182,17 @@ but you want to suppress kobject uevents, as you have a custom solution which
>  will monitor for your device addition into the device hierarchy somehow and
>  load firmware for you through a custom path.
>
> +The custom fallback mechanism can often be enabled by mistake. We currently
> +have only 2 users of it, and little justification to enable it for other users.
> +Since it is a common driver developer mistake to enable it, help police for
> +new users of the custom fallback mechanism with::
> +
> +        $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
> +        $ make coccicheck MODE=report
> +
> +Drivers can only be transitioned out of the custom fallback mechanism
> +once we know old userspace cannot be not be broken by a kernel change.
> +
>  Firmware fallback timeout
>  =========================
>
> diff --git a/scripts/coccinelle/api/request_firmware-custom-fallback.cocci b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
> new file mode 100644
> index 000000000000..c7598cfc4780
> --- /dev/null
> +++ b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
> @@ -0,0 +1,37 @@
> +// Avoid the firmware custom fallback mechanism at all costs
> +//
> +// request_firmware_nowait() API enables explicit request for use of the custom
> +// fallback mechanism if firmware is not found. Chances are high its use is
> +// just a copy and paste bug. Before you fix the driver be sure to *verify* no
> +// custom firmware loading tool exists that would otherwise break if we replace
> +// the driver to use the uevent fallback mechanism.
> +//
> +// Confidence: High
> +//
> +// Reason for low confidence:
> +//
> +// Copyright: (C) 2016 Luis R. Rodriguez <mcgrof@kernel.org> GPLv2.
> +//
> +// Options: --include-headers
> +
> +virtual report
> +virtual context
> +
> +@ r1 depends on report || context @
> +expression mod, name, dev, gfp, drv, cb;
> +position p;
> +@@
> +
> +(
> +*request_firmware_nowait@p(mod, false, name, dev, gfp, drv, cb)
> +|
> +*request_firmware_nowait@p(mod, 0, name, dev, gfp, drv, cb)
> +|
> +*request_firmware_nowait@p(mod, FW_ACTION_NOHOTPLUG, name, dev, gfp, drv, cb)
> +)
> +
> +@script:python depends on report@
> +p << r1.p;
> +@@
> +
> +coccilib.report.print_report(p[0], "WARNING: please check if driver really needs a custom fallback mechanism")
>
