Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A9371072;
	Mon,  7 Sep 2026 23:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788825463; cv=none; b=SAY+zVjCK5XVoy6WBoSWbiDA+1LW+WhiS772wzHup4ROYGAH0hCOsT5rFY3DWhiAlue9uOfwuJCQUiiHo8izvdNSCHp5t9Rv6cC4k+kAEcoTlh/mGnJ7BZWneb71UtGkgFE2n4MkGp2acIpvM250dO72TShd4khsnHpO11WuOfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788825463; c=relaxed/simple;
	bh=bqb1qrfK3t13YNrrwaZPlt2m0aMYTh4cqy+ghPkxcVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lvh0v0BaR320Nqu1lUNMfacXpxgeFgFF6WVXX3nzKyeMPYhjMtFhRYb2r8fiIBrhVbB+KomJVvHL9sgZkBl6Ce8u96m2vglXMjwVqJR1uFwOxY44QeCNl3KiuVC6nnvsLJ0N5koZorRbutLlVma6iTY/mv7Vuvhl4TY7HTlJHy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEy6YPM5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEy6YPM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAE61F00A3A;
	Mon,  7 Sep 2026 23:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788825462;
	bh=M3QOh/EedUrBMzWWqKQU95p62Rc0/I+gLt1UpsmSSK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fEy6YPM5c10Ok1mUOTS+sl8AYCAZ+RC4unf9igAWJsbpP19SoxXiGmGkOTCdGsUYC
	 yyhsb3fkhYstfvshJBWYc8AJuAoABfbxx4xPuFWT4moOoWe8C8rRuTPhSRDQFLZlAx
	 g5Z51+k3bq708B5oYb5us40Ftdhdg5C58ZvUR4WOrVCU/ZhevZucZTysK/8z1qP1B1
	 RkauOcK8j80wy/8kUSJLuDM3xWtrU5p7TkSPrTvbTFk5UVjAgqBGRRXxRdOEqeV2oM
	 sCAN1CNhCgI6F8yZtTAVsk691BtTXFrtQqZf3KjDVc740TIqpz7IHDAvwL7Z7lk/Vi
	 3M6WT+JgNWJnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/3] leds: aw2013: Rename to aw20xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-2-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
 <20260907-aw2013-aw20xx-rename-v1-2-c9a7df12a701@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 23:57:41 +0000
Message-Id: <20260907235741.BBAE61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] I2C writes are sent to an unpowered chip when turning off an alrea=
dy disabled LED during teardown, probe, or unregistration.
--

commit 61355e5955755b194e075840a94eea7f1c7e4fa1
Author: Paul Sajna <sajattack@postmarketos.org>
Date:   Mon Sep 7 23:47:52 2026 +0000

    leds: aw2013: Rename to aw20xx
   =20
    I had to split this into a separate commit for git to properly detect
    this as a rename rather than remove/add. Next commit will add another
    chip to justify the rename.
   =20
    Includes update of Makefile, Kconfig, Kconfig help, and raw leds-aw2013=
.c
    rename.
   =20
    Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

[ ... ]

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw20xx.c
> similarity index 100%
> rename from drivers/leds/leds-aw2013.c
> rename to drivers/leds/leds-aw20xx.c

[Severity: High]
This isn't a bug introduced by this patch, but is it possible that I2C writ=
es
are sent to an unpowered chip when turning off an already disabled LED?

During teardown, probe, or unregistration, the LED core initializes
cdev->brightness to 0 and queues a work to set the brightness to 0. This can
also be triggered by unprivileged user space via sysfs by writing 0 to the
brightness file when already 0.

When this occurs, aw2013_chip_in_use() evaluates to false and skips enabling
the regulators:

drivers/leds/leds-aw20xx.c:aw2013_brightness_set() {
    ...
	if (aw2013_chip_in_use(led->chip)) {
		ret =3D aw2013_chip_enable(led->chip);
		if (ret)
			goto error;
	}

	num =3D led->num;

	ret =3D regmap_write(led->chip->regmap, AW2013_REG_PWM(num), brightness);
    ...
}

Because aw2013_chip_enable() is skipped, the driver then unconditionally
calls regmap_write() and regmap_update_bits(), which perform I2C
transactions to the unpowered chip.

Could writing to an unpowered I2C device clamp the SDA/SCL lines to ground
via the chip's internal ESD diodes, hanging the entire I2C bus and making
all other devices on the bus unusable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-aw2013-aw2=
0xx-rename-v1-0-c9a7df12a701@postmarketos.org?part=3D2
