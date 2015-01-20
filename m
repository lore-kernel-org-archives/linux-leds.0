From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH/RFC v10 04/19] dt-binding: mfd: max77693: Add DT binding
 related macros
Date: Tue, 20 Jan 2015 11:12:43 +0000
Message-ID: <20150120111243.GC13701@x1>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-5-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:59686 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753717AbbATLMu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 20 Jan 2015 06:12:50 -0500
Received: by mail-ig0-f178.google.com with SMTP id hl2so14409178igb.5
        for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2015 03:12:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1420816989-1808-5-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, 09 Jan 2015, Jacek Anaszewski wrote:

> Add macros for max77693 led part related binding.
>=20
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  include/dt-bindings/mfd/max77693.h |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/max77693.h
>=20
> diff --git a/include/dt-bindings/mfd/max77693.h b/include/dt-bindings=
/mfd/max77693.h
> new file mode 100644
> index 0000000..f53e197
> --- /dev/null
> +++ b/include/dt-bindings/mfd/max77693.h
> @@ -0,0 +1,21 @@
> +/*
> + * This header provides macros for MAX77693 device binding
> + *
> + * Copyright (C) 2014, Samsung Electronics Co., Ltd.
> + *
> + * Author: Jacek Anaszewski <j.anaszewski@samsung.com>
> + */
> +
> +#ifndef __DT_BINDINGS_MAX77693_H__
> +#define __DT_BINDINGS_MAX77693_H
> +
> +/* External trigger type */
> +#define MAX77693_LED_TRIG_TYPE_EDGE	0
> +#define MAX77693_LED_TRIG_TYPE_LEVEL	1
> +
> +/* Boost modes */
> +#define MAX77693_LED_BOOST_OFF		0
> +#define MAX77693_LED_BOOST_ADAPTIVE	1
> +#define MAX77693_LED_BOOST_FIXED	2
> +
> +#endif /* __DT_BINDINGS_MAX77693_H */

These look fairly generic.  Do generic LED defines already exist?  If
not, can they?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
