From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH -next] leds: mlxcpld: remove unused including
 <linux/version.h>
Date: Tue, 13 Sep 2016 16:12:35 +0000
Message-ID: <AM5PR0501MB20977BD3458B0EC1703D72EEA2FE0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1473778735-11398-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-db5eur01on0064.outbound.protection.outlook.com ([104.47.2.64]:7071
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755204AbcIMQMi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 13 Sep 2016 12:12:38 -0400
In-Reply-To: <1473778735-11398-1-git-send-email-weiyj.lk@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>



> -----Original Message-----
> From: Wei Yongjun [mailto:weiyj.lk@gmail.com]
> Sent: Tuesday, September 13, 2016 5:59 PM
> To: Vadim Pasternak <vadimp@mellanox.com>; Richard Purdie
> <rpurdie@rpsys.net>; Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-leds@vger.kernel.org
> Subject: [PATCH -next] leds: mlxcpld: remove unused including <linux/vers=
ion.h>
>=20
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> Remove including <linux/version.h> that don't need it.
>=20
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/leds/leds-mlxcpld.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c in=
dex
> 125ddfa..f4a0bbd 100644
> --- a/drivers/leds/leds-mlxcpld.c
> +++ b/drivers/leds/leds-mlxcpld.c
> @@ -42,7 +42,6 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> -#include <linux/version.h>
>=20
>  #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR     0x2500 /* LPC bus access */

Acked-by: Vadim Pasternak <vadimp@mellanox.com>
