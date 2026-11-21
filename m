Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795260387;
	b=rW0bdvTu88+TATe16s7UvAfV5fxRd65JWtdCSZQK+XYwb8PM6QSpUEjKOsjc8yl1EfTC
	 V9HV7H0irJAHRAjT56473TUsVy8FHNNYMHhJ8w0HZE74/FRT2sLGst8/5MDr18j5pz333
	 XQ+pKnRHxbg0mfMUtgscl2J+oWVZEZca6SIGbvcklIRXmodaBDEJ3ABYMilIgLb/e9Afz
	 QJbvO23Q3ZfgdSb3EiZVOXu3Oc7hJtsuPYsN1VquabliTrt//OxANW4I5K6Suu//dzBUY
	 HAapJ0LvcVb5uAJ/gYlApjx+PwLXKJfo449DYpsQ9jc4wFXi1cJx7QhGOjHCZ2fux7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260387;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=WvQDY/6XJyxZ6Kpv8z5j97OZsE+oBbUMKjQCg9UF338=;
	b=yXEWxzfpLJm6NAD8/wDorU3A2G1PzuNt2kzM3q7Jyr8gRqq9rNSG/ML4PXvlG2ZNOARu
	 NrxBACGQzsO4FuXR7cU3b3x/04hVvCTZ5ZH6lcVYMqFfVxNhRxYI1f0ssALg3aCWQ2vVp
	 pceTt8Z7E4vEs7wNCYsA1+mFKMMV4niFJmWrknUS/KU6K4fMjbvYfX0w87EU3EgT2FHof
	 nKvNcHnrGf12yWBMNV+cl6hiIF3ktvlR3pQqpA+j17G0es60LNpQZPqAvbKwt7nEfx87Y
	 7g4QhCf64R27VVW29TLIyVVsAv1lVtq+5UbBae368t/tVNEk2SQm0p4v1y5yt48CnzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="O7txkv/7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D75606A320;
	Sat, 21 Nov 2026 11:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D75606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=O7txkv/7
ARC-Seal: i=1; a=rsa-sha256; t=1795260383; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LfnecYbJB3tiXd3+OdXcW4xfTeDsckeWNW3jE+dQxIvpjOXJzBt4d2VTihl2eucF2IPvNfv6Awb/0avpl5IFokbJTzeMgVZza2eEqwhnGRE3EbIiiw7Hl+dy+/Rc1o2azmQ6cZmnsrzk4gZCn3IbqNTlVAsvpHW/1y46YzscIWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795260383; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WvQDY/6XJyxZ6Kpv8z5j97OZsE+oBbUMKjQCg9UF338=; 
	b=nn3hbXXjvHa1R4KhwVoEK3WLQeX3u/wrU5lLYnOXj4LlBrBhp+yXJ3v3HB5zjZUq4LMF+D2Lp+NBDPqM1bpcLhMhPpCxdNmjOXzZCGun4q5yeEOphGCz/zBB2zAsAN2GE7QNH4/9tyKwrWKM9hHXdoVuoSOjWlERERbn7+VM4QQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=O7txkv/76duCn9RR421LaI50xLXgTkaThBMrWJtHHOm+tpF+oHWRYRyk9OSNGCCNUPSXVR1c2bSokMBV3eUVS/e898xW+AqJX1SqcQ70xVO6LyXgOoWxWAWXQXGpJPa+U53NfI+XDvvEbpoiPvGiRdVmBWN2rh5h3E5UKt1nk3lq83PR8p2jBVXn4kLrTgPtmKo6vYGn2jxCizRJOgtyHYepquVMhBV08IJZnGQc5D28jd6TiURnwn/yDJD996I9fRr24Nf4bTkfTgwZE+GjLkhNz2+2Rn87VOBIbjLYpR6XQg3X1uYzc9yVEHjgOPCVDrxrWS1QB2K+TVB8ukEpRA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=WvQDY/6XJyxZ6Kpv8z5j97OZsE+oBbUMKjQCg9UF338=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795260379820428.61296969080024;
	Sat, 21 Nov 2026 03:26:19 -0800 (PST)
Message-ID: <77c77dd13a1cc44416ceb28ee4dacfab51c7c220.camel@rong.moe>
Subject: Re: [PATCH v3 00/11] leds: class: Support custom sysfs groups on
 multicolor and flash LEDs
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 19:21:11 +0800
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Armin,

On Fri, 2026-11-20 at 22:22 +0100, Armin Wolf wrote:
> Until now drivers are unable to atomically register custom sysfs
> groups below multicolor and flash LED class devices, because the
> led_cdev->sysfs_groups field is being overwritten inside the
> associated initialization functions. This patch series tries to
> fix this.
>=20
> The first three patches constify the sysfs attributes of all three
> LED flavors, while the next four patches fix various unrelated issues
> affecting LED device initialization. The next two patches migrate
> the multicolor and flash LEDs to use struct device_type for
> registering their sysfs attributes, so that led_cdev->sysfs_groups is
> not touched anymore. The last patch contains a minor optimization
> for multicolor LEDs.
>=20
> All patches have been tested on real hardware, with the flash LED
> interface being tested using a custom kernel module.

The series looks good to me (except for PATCH 10, as I am not familiar
with that driver).

FWIW, for PATCH 1-9,11:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

>=20
> Changes since v2:
> - fix issue inside KTD202X driver
>=20
> Changes since v1:
> - use READ_ONCE() inside brightness_hw_changed_show()
> - fix possible deadlock in led_classdev_notify_brightness_hw_changed()
> - set led_cdev->dev to NULL when initialization fails
> - call device_set_node() after device_add()
>=20
> Armin Wolf (11):
>   leds: class: Constify sysfs attributes
>   leds: multicolor: Constify sysfs attributes
>   leds: flash: Constify sysfs attributes
>   leds: class: Create "brightness_hw_changed" attribute atomically
>   leds: class: Fix race condition when creating the device
>   leds: class: Access brightness_hw_changed exactly once
>   leds: class: Use correct type for brightness_hw_changed field
>   leds: class: Split led_classdev_register_ext()
>   leds: Support custom sysfs groups on multicolor and flash LEDs
>   leds: rgb: ktd202x: Initialize max_brightness before registering LED
>   leds: multicolor: Adjust maximum subled intensity during
>     initialization
>=20
>  drivers/leds/led-class-flash.c      | 153 +++++++++---------
>  drivers/leds/led-class-multicolor.c |  76 ++++-----
>  drivers/leds/led-class.c            | 233 +++++++++++++++++++---------
>  drivers/leds/leds.h                 |   3 +
>  drivers/leds/rgb/leds-ktd202x.c     |   4 +-
>  include/linux/led-class-flash.h     |   5 -
>  include/linux/leds.h                |   2 +-
>  7 files changed, 278 insertions(+), 198 deletions(-)
