From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v9 2/2] leds: add driver for support Mellanox regmap LEDs
 for BMC and x86 platform
Date: Sun, 18 Feb 2018 05:48:56 +0000
Message-ID: <AM4PR05MB333007898CC26CCB131619C3A2C90@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1518737870-73290-1-git-send-email-vadimp@mellanox.com>
 <fadb3132-9cc9-745e-2852-52b145f1a7ee@gmail.com> <20180216222558.GA5265@amd>
 <45298ab7-9558-3df4-57e7-c3c198a805b8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr40058.outbound.protection.outlook.com ([40.107.4.58]:5546
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750705AbeBRFtC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 18 Feb 2018 00:49:02 -0500
In-Reply-To: <45298ab7-9558-3df4-57e7-c3c198a805b8@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>



> -----Original Message-----
> From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]
> Sent: Saturday, February 17, 2018 11:55 PM
> To: Pavel Machek <pavel@ucw.cz>
> Cc: Vadim Pasternak <vadimp@mellanox.com>; rpurdie@rpsys.net; linux-
> leds@vger.kernel.org; jiri@resnulli.us
> Subject: Re: [PATCH v9 2/2] leds: add driver for support Mellanox regmap =
LEDs
> for BMC and x86 platform
>=20
> On 02/16/2018 11:25 PM, Pavel Machek wrote:
> > Hi!
> >
> >>> +++ b/drivers/leds/leds-mlxreg.c
> >>> @@ -0,0 +1,309 @@
> >>> +/*
> >>> + * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
> >>> + * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
> >>> + *
> >>> + * Redistribution and use in source and binary forms, with or
> >>> +without
> >>> + * modification, are permitted provided that the following condition=
s are
> met:
> >>> + *
> >>> + * 1. Redistributions of source code must retain the above copyright
> >>> + *    notice, this list of conditions and the following disclaimer.
> >>> + * 2. Redistributions in binary form must reproduce the above copyri=
ght
> >>> + *    notice, this list of conditions and the following disclaimer i=
n the
> >>> + *    documentation and/or other materials provided with the distrib=
ution.
> >>> + * 3. Neither the names of the copyright holders nor the names of it=
s
> >>> + *    contributors may be used to endorse or promote products derive=
d
> from
> >>> + *    this software without specific prior written permission.
> >>> + *
> >>> + * Alternatively, this software may be distributed under the terms
> >>> +of the
> >>> + * GNU General Public License ("GPL") version 2 as published by the
> >>> +Free
> >>> + * Software Foundation.
> >>> + *
> >>> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> >>> + * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> >>> +LIMITED TO, THE
> >>> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> >>> +PARTICULAR PURPOSE
> >>> + * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> >>> +CONTRIBUTORS BE
> >>> + * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
> >>> +OR
> >>> + * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> >>> +PROCUREMENT OF
> >>> + * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> >>> +BUSINESS
> >>> + * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> >>> +WHETHER IN
> >>> + * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> >>> +OTHERWISE)
> >>> + * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> >>> +ADVISED OF THE
> >>> + * POSSIBILITY OF SUCH DAMAGE.
> >>> + */
> >
> > You may want to switch on to spdx next time you update the driver...
> >
> 	Pavel
> >
>=20
> >
>=20
> Right, so I propose the following modification:
>=20
> diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c inde=
x
> cc9f297..56d6f30 100644
> --- a/drivers/leds/leds-mlxreg.c
> +++ b/drivers/leds/leds-mlxreg.c
> @@ -1,35 +1,7 @@
> -/*
> - * Copyright (c) 2018 Mellanox Technologies. All rights reserved.
> - * Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions ar=
e met:
> - *
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions and the following disclaimer.
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in th=
e
> - *    documentation and/or other materials provided with the distributio=
n.
> - * 3. Neither the names of the copyright holders nor the names of its
> - *    contributors may be used to endorse or promote products derived fr=
om
> - *    this software without specific prior written permission.
> - *
> - * Alternatively, this software may be distributed under the terms of th=
e
> - * GNU General Public License ("GPL") version 2 as published by the Free
> - * Software Foundation.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR PURPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> CONTRIBUTORS BE
> - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT OF
> - * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
> BUSINESS
> - * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> WHETHER IN
> - * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> OTHERWISE)
> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
> OF THE
> - * POSSIBILITY OF SUCH DAMAGE.
> - */
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) // // Copyright
> +(c) 2018 Mellanox Technologies. All rights reserved.
> +// Copyright (c) 2018 Vadim Pasternak <vadimp@mellanox.com>
>=20
>=20
>=20
> If everyone agrees I can fix the original commit in the linux-leds.git by=
 myself.

Acked.

Thank you very much.
Vadim.

>=20
> --
> Best regards,
> Jacek Anaszewski
