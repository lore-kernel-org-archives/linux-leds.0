From: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] led: core: Fix brightness setting when setting
 active_off=0
Date: Wed, 27 Dec 2017 10:16:57 +0100
Message-ID: <20171227101657.1f00ecd3@perruche.parrot.biz>
References: <20171212101044.22596-1-matthieu.castet@parrot.com>
        <95b148d6-6b21-ef67-ff69-ab471222c51d@gmail.com>
        <a097e3df-1803-4496-0df6-0c4d7f8a54b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr30042.outbound.protection.outlook.com ([40.107.3.42]:29943
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750908AbdL0JRF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 27 Dec 2017 04:17:05 -0500
In-Reply-To: <a097e3df-1803-4496-0df6-0c4d7f8a54b0@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Jacek,

Le Sat, 23 Dec 2017 11:33:40 +0100,
Jacek Anaszewski <jacek.anaszewski@gmail.com> a =C3=A9crit :

> Hi Matthieu,
>=20
> I was to send this fix for 4.15-rc5, but just realized the
> possible mistake in the subject. Would you mind if I did
> the following amendment?:
>=20
> s/active_off/delay_off/
>=20

No problem ;)
