Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207391;
	b=NHXSdAunx0uXo2vTptKcUaS2EE4RoMCPpebP9UupJJ4glC+nKBxIqJ6tOkJRKx9n9NfX
	 oS0YFeaJ1YHv1dwhZtOC5tAw1gE7cTiTO7OBQipXXX1jn4k1zv0co3A5nHm6QMgFTWzuN
	 VxQ+mW9OXdNsgKRsIW3Tl0DDZxyEY8CHhQs0m0CSIQhZ8Fopz1lBcdcWT7fpgSakZDCzv
	 6TqbchSbNxybOvQ99m3DoQyaIASxYMolM5mC5neceyqvxt+7dLSzGxv4kvIUGtqu1/W/x
	 Z18uCR1eKIzOgQXxdp27BCeGps9EjkvFoGdZA+jqbvXdiEk86jC6dmgQi8w4gKMrX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207391;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=GtpWLuKi2bw0bXTMg9eqHSKGCwW8dkih4F5R+CbsX2A=;
	b=HYW8TwBVFuL77i+TMtBxgreu3E5xbCzqLyxz8AegF6KRr9qeaphD8ZzWdbXQFV6nqXY2
	 Ek3rLIkPlRZyq4mODUJzrEzJcICrMRuh+Jhlv0Cgy7BOk1ESMUtPtkBJQjtURhfkJn5iC
	 ULhmHAbgrRBZAublNt/OFka2R9c0KvHwX3rLWideKDZ7BxDcANnOGmukpW6uBeZSjvC5d
	 OlmEqorL2urUukhwP0uAwYRu1UvpFmDMqw5NuWdQ1/ZMkkPCUOi0VsZzbgdAlc4oBd5Hz
	 HJKUAnWpIlU2U5Z9HNZ77pMeGxfEQ4wqT3IH4Eid2MPRIsFVBXIlx4swnIb+Iran0Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="ZpL75/50";
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8E606EEC1
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD8E606EEC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ZpL75/50
DKIM2-Signature:  i=1; m=1; t=1795207387;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:QqSgRh9CFV34DEJFV5VgDLouCPEi
   xbwpjGngeFAwA6sE/TuiXzTxIB8U8pMcvu+fXPwbi+2tCVlGSFJbY7MknWr3LZ/Q8tQq7SQKxFF
   4OE21iSc2B08+YhNcGiV4wh/as2LV6SpKxG8RG3ykurbepBRwODPt227vmC6wxfYYpZHT0NFnyX
   Fv0APcjgf0soASyYxmItbBU9G+CrhKRDX1IDHTQNNc1/GninbwTxpReleu6o+GDGInTnX3MFTxZ
   /aUlyNdMlvsX3Kl/gf6OWq3AoExl98dts3JYTWyqMuj6Hb0pNgtijfegLCjiQvtL7jd0IRF83+e
   tYq7j4wShetj1Q==;
Message-Instance:  m=1;
 h=sha256:
   Qvqcfpvr1Kzg3sfLAqDOftUtfF3YLHYpMYQGry6MjIE=:
   yJ55imo6oMSxLAD1rzezLTsRthZwggjtxum4nqieCP8=,
  sha512:
   Wdub9cL1kl+77kwshuiGJHvuA6YwPqpnXo3TBs4G2SmJNHLr1CurJjU/TEcGLBe1Z8rLv34uBNS3U7+eVojK6A==:
   ba/xhaSz/6s/OL7Wx2iYAsW+i/nFxNtA92Juc7AP0vrUA8jzWc/evYgIgL2nB3m5G366kHMplJmQPHuihgDBIQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207379; x=1795812179; i=w_armin@gmx.de;
	bh=GtpWLuKi2bw0bXTMg9eqHSKGCwW8dkih4F5R+CbsX2A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZpL75/50JVYUd6X4mtDeCwrQQs25AAveo1uRga4Uh5wAe84re5bgsR5wPLcdY9yM
	 YqGczkkF8RBzKB968f/MK0rBUAA/JnkhIReq//g2dc7+2RT+WDnrbj24inICeA+Ec
	 b/GKfjRMcBxTntDKRr+ZOMZMsNn0f30HyebHeY4InH29r0DYgY6C9XwtcJFMKrSGy
	 5Sl+mTq+aUoOoWiQNOSK3t+kNAGLBtxxdY5oWbd+9mcnn9Egn2bZPTccNFMDFSh39
	 nf8d4z16Kf25PBVlvn2CiVODsWRCG/BMDjSU3SquSjQro0V/VG8Qvdb3NMvWR1ead
	 bz5bZrpUaLj/KrbsCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MD9T1-1xdY0J3PSD-00GmmJ; Fri, 20
 Nov 2026 21:42:58 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 00/10] leds: class: Support custom sysfs groups on multicolor and flash LEDs
Date: Fri, 20 Nov 2026 21:35:12 +0100
Message-ID: <20261120204246.6645-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NHQKIv98s9n5S/GufS8pYC4qQonHxp1DjRJSqMxbzHzJU8Ywdk6
 +yYjKtQqLXTOkmjkXPD0ft/nHSj8F6R9IFcjMhw0gUvdTStUacvs3xNSYKkBNlG1CYakmFg
 sMhs1GAKuQlc+KnjdY1Mcs/39sIGt5tVvK4Ai1POzQ0CNOOnCAg9ErlbiSSJnKx6qD8KOER
 NyYVh3IzsN4uLcIUbYXsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/x23O0X3apI=;ScnPBHsX2NwS94A600dIHodhJlb
 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
 kboRTyoKXhGDnWocJbpTtuGKDCbRWu+3c

Until now drivers are unable to atomically register custom sysfs
groups below multicolor and flash LED class devices, because the
led_cdev->sysfs_groups field is being overwritten inside the
associated initialization functions. This patch series tries to
fix this.

The first three patches constify the sysfs attributes of all three
LED flavors, while the next four patches fix various unrelated issues
affecting LED device initialization. The next two patches migrate
the multicolor and flash LEDs to use struct device_type for
registering their sysfs attributes, so that led_cdev->sysfs_groups is
not touched anymore. The last patch contains a minor optimization
for multicolor LEDs.

All patches have been tested on real hardware, with the flash LED
interface being tested using a custom kernel module.

Changes since v1:
- use READ_ONCE() inside brightness_hw_changed_show()
- fix possible deadlock in led_classdev_notify_brightness_hw_changed()
- set led_cdev->dev to NULL when initialization fails
- call device_set_node() after device_add()

Armin Wolf (10):
  leds: class: Constify sysfs attributes
  leds: multicolor: Constify sysfs attributes
  leds: flash: Constify sysfs attributes
  leds: class: Create "brightness_hw_changed" attribute atomically
  leds: class: Fix race condition when creating the device
  leds: class: Access brightness_hw_changed exactly once
  leds: class: Use correct type for brightness_hw_changed field
  leds: class: Split led_classdev_register_ext()
  leds: Support custom sysfs groups on multicolor and flash LEDs
  leds: multicolor: Adjust maximum subled intensity during
    initialization

 drivers/leds/led-class-flash.c      | 153 +++++++++---------
 drivers/leds/led-class-multicolor.c |  76 ++++-----
 drivers/leds/led-class.c            | 233 +++++++++++++++++++---------
 drivers/leds/leds.h                 |   3 +
 include/linux/led-class-flash.h     |   5 -
 include/linux/leds.h                |   2 +-
 6 files changed, 276 insertions(+), 196 deletions(-)

=2D-=20
2.56.1

