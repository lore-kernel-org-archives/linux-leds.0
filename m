Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DFD34CFD3
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 05:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613447; cv=none; b=cn8MPM5mPv/PQ4aC90Vy8BQCI1BqSdP3D0r64Zc5MHxeJihlPQOGHjrqLShjmGlVyta8++jWv1zppyjHFrrCvDOD+FlQ1jh4daagUaysP1jHKhY9gQm3aHDaE68f4HrDvnivClWrGrv+agzL2ORLQhf5TMdWnvIsCcgASnMfoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613447; c=relaxed/simple;
	bh=TWY/hucO8gS8+UGJOpXM79j58HVFOVapWxFci70FRyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gohw1YFtMgBX1O9URpbYSjpyG+n/y9DeJN0NRIjwi+4WSLwds4GpVSjlkvvdoYkE5S0y/E9z+jwjGB4JJY9OjyJGUYVX+g+SlfBW5b7dkQ+5QL0JunsUJWKlX7GrBBHiSKePlkGAUDoggbrKVwKmwwbf9bGlb23DnP137G2OVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWlw9cvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWlw9cvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8240A1F000E9;
	Tue, 21 Jul 2026 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784613445;
	bh=FIlxlqcyvUpISpG/hgYG2MDfc/IeqqLRreCQOxJEiiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWlw9cvtGVku1hKLkypJe0FIt5Ut+S1VBPju278UT47zXXj7dnCtXjL2hUz81ZX/p
	 SmSrdqNxwcIClrh46SOj/ibvgeNQ5xDy5I80ubsACLyQiILE9DNGP11R7J6ttF/19G
	 /EgrFeKMSXaCW+Vy52r0y8RaAAosWKdDqg44yKkbeI4cDpTpFDAUkAOGY0+009Ln0e
	 ydubbKrh9d/NCmoHjlyjkDJr1bUuna3IJyEWzpyDrNOCBWRKUvn6kBw2iAvRqz6DXK
	 8t3kX7OIevn3DzJ2lPdMn+vpMU/3sByenVfAxIoFzErsGziTbY9Fx1B51DVOVCPvPH
	 JTC7xLoanhdbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] leds: flash: s2m: wire up of_match_table in
 platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260721054846.34318-3-kr494167@gmail.com>
References: <20260721054846.34318-1-kr494167@gmail.com>
 <20260721054846.34318-3-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 05:57:25 +0000
Message-Id: <20260721055725.8240A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Adding `.of_match_table` exposes the driver to standalone DT probi=
ng, breaking the assumption that it is strictly instantiated as an MFD cell=
, leading to a NULL pointer dereference or type confusion.
- [Low] The commit message violates the subsystem's capitalization guidelin=
es for the description.
--

--- Patch [2]: [PATCH 2/2] leds: flash: s2m: wire up of_match_table in plat=
form driver ---
commit 2a98fe49f1f26ddb2bdb4a505ce05edc54a427b5
Author: surendra <kr494167@gmail.com>

leds: flash: s2m: wire up of_match_table in platform driver

This patch wires up the s2m_fled_of_match_table to the platform driver's
of_match_table field to allow DT-based probing and module auto-loading.

> leds: flash: s2m: wire up of_match_table in platform driver

[Severity: Low]
This isn't a bug, but the LED subsystem guidelines request capitalizing the
description after the subsystem prefix. Should "wire" be "Wire"?

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> index 6ee8db094611a..2373a70d83ebd 100644
> --- a/drivers/leds/flash/leds-s2m-flash.c
> +++ b/drivers/leds/flash/leds-s2m-flash.c
> @@ -339,6 +339,7 @@ MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
>  static struct platform_driver s2m_fled_driver =3D {
>  	.driver =3D {
>  		.name =3D "s2m-flash",
> +		.of_match_table =3D s2m_fled_of_match_table,

[Severity: High]
Does adding the of_match_table expose the probe function to a NULL pointer=
=20
dereference if probed standalone via a device tree?

Looking at s2m_fled_probe(), it assumes it is always instantiated strictly =
as
an MFD cell:

drivers/leds/flash/leds-s2m-flash.c:s2m_fled_probe() {
    struct sec_pmic_dev *ddata =3D dev_get_drvdata(dev->parent);
    ...
    ret =3D s2mu005_fled_init(led, dev, ddata->regmap_pmic, MAX_CHANNELS);

If this driver is bound directly via a device tree node at the root of the
device tree or under a generic bus, dev->parent won't be the MFD parent.
This means dev_get_drvdata(dev->parent) could return NULL or unrelated data,
leading to a crash when accessing ddata->regmap_pmic.

>  	},
>  	.probe =3D s2m_fled_probe,
>  	.id_table =3D s2m_fled_id_table,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721054846.3431=
8-1-kr494167@gmail.com?part=3D2
