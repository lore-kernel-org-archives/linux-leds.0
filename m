Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1C493658
	for <linux-leds@vger.kernel.org>; Sat, 22 Aug 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787426218; cv=pass; b=UEXwxQbF4ICZiX2yVXGokldffJMH9fTj7v9yU+QYjaq6w1+iUWGKkF4ZBzYAiw0uMLfHEMFQ/PIFeYpJCL7k9jB+laR/m17K4xSJDb/6QjDUzo7utC8Ahs63fUbVrDbUaF4XHw91zVmn7i2CFRx5pUHqE8YEwLCtEJ2qHJVPHWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787426218; c=relaxed/simple;
	bh=eVqz7cTe8hTnrBzjfvV68Aj4B3ktVr2wx8c+hb1HKuA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=POaBd3bmzKy7Ow1SziIvIHxd7Gt+4f5SGdSWbWFYPWh/Ge2Xab7B55iEz+tPo/l0jKw3zN/MzZm7p/6IjTdSZhTFCJeXlWV7cMyNcOD9VgOyMLmme6FKNLAbrcy9t2OBxSn767kxn9WgnV06jdToDEtfXFV17EF9mdvIk4S9FPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mtHkefYc; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mtHkefYc"
ARC-Seal: i=1; a=rsa-sha256; t=1787426211; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IgKplZvniDQWXxa3oyK3bLuoTwQaUs9B4fnr6BR8oI+pW4fCjvelc2VgnJocQOGrLVKHWjamm2YktijWABuYAlySWj5BdypgWbG90Wv35adMis6f28d9l64oZ8BeML8/7XWvY61UuO+23LZRvVtyEMByMH0hM+JAhlQPOANr5cA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787426211; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wNLfVSPfxNFh98lDllmGvQ3ZWGgKx4vePWz3EvTn5E4=; 
	b=fyACwn2HncYvPxz4oSBS7llSS1ueI4bdA9fenxj5fNryeEoOBbYjOd0zCqG9rsyn3py912frNMX8yQQH76VrTDUcMc9Qvx6V9gn8HsPLwOTylTV9nhSxThV2Yn///pDfWlVSX0qu+/1G024kpd9t+0Ut9dtbAhHsnYCnGRu6/Bg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787426211;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=wNLfVSPfxNFh98lDllmGvQ3ZWGgKx4vePWz3EvTn5E4=;
	b=mtHkefYcCHL4wKZk5a3zxPHLxAHUTKlIX5bDNYhRw5PXLZV069hYTiCFxtlLIZf9
	3b3torQykjCmfLo3AhYi2f89ZFxy/5LZVAZsJiR5aKu1zoAjQMqmuQIk5T8Foht9a+m
	ji46wqVVBEk9Oc1NVyOGUP5CQLt/KJSBTS2FPA+Vrt38vtbvI3maa8223lhFtfV6Yuw
	LapywsGr0a0gFpSroLMAFZU4/8Z4sxvcuG+VLIDP9PsvVva3RIacKylT/vYVXGNiRqw
	VfQxsQQQVtkVu7bk662LRdue7kpilLAn0FASHGuKfBpn4tzQ/r1DjXOzxrHrgUN3Fkl
	P7XxF+k/pw==
Received: by mx.zohomail.com with SMTPS id 1787426209584445.2634531021255;
	Sat, 22 Aug 2026 12:16:49 -0700 (PDT)
Message-ID: <fa46130179d452017734b10978c18b055cd55103.camel@rong.moe>
Subject: Re: [PATCH v5 07/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821172737.EF6021F00A3D@smtp.kernel.org>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
		 <20260821-leds-trigger-hw-changed-v5-7-3e00d6c4a936@rong.moe>
		 <20260821172737.EF6021F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 03:10:58 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi all,

On Fri, 2026-08-21 at 17:27 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Sysfs attributes are exposed to user-space before the `trigger_l=
ock` rwsem is initialized, causing uninitialized lock access.

Valid concern. This bug was introduced in commit b819dc7d8fb2 ("leds:
core: Report ENODATA for brightness of hardware controlled LED"), as the
check is not protected by led_access.

Since the series touches what was introduced by the said commit, I will
prepend a fix commit in the next revision by protecting it with
led_access.

Thanks,
Rong

> --
>=20
> --- Patch [7]: [PATCH v5 07/12] leds: trigger: Enforce strict checks in l=
ed_trigger_is_hw_controlled() ---
> commit ebab4e455acab29c44baf2a4a586beae42254bc5
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()
>=20
> With all existing triggers adopting the new interface, strict checks
> could be enforced to make the semantics of hardware control triggers
> clearer.
>=20
> > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> > index de17a8bbb4d48..cb49a02a8b3cf 100644
> > --- a/drivers/leds/led-triggers.c
> > +++ b/drivers/leds/led-triggers.c
> > @@ -42,9 +42,16 @@ static bool __led_trigger_is_hw_controlled(struct le=
d_classdev *led_cdev)
> >  	if (!led_cdev->trigger)
> >  		return false;
> > =20
> > +	if (!led_cdev->hw_control_trigger ||
> > +	    strcmp(led_cdev->hw_control_trigger, led_cdev->trigger->name))
> > +		return false;
>=20
> [Severity: High]
> This is a pre-existing issue, but since this patch modifies the hardware
> control paths, is it possible to access an uninitialized rw_semaphore her=
e?
>=20
> In drivers/leds/led-class.c, the device and sysfs attributes are created
> and exposed to user-space before the trigger_lock rwsem is initialized:
>=20
> led_classdev_register_ext() {
>         ...
>         led_cdev->dev =3D device_create_with_groups(&leds_class, parent, =
0,
>                                                   led_cdev, led_cdev->gro=
ups,
>                                                   "%s", final_name);
>         ...
>         init_rwsem(&led_cdev->trigger_lock);
>         ...
> }
>=20
> If user-space processes the uevent quickly enough and reads the brightnes=
s
> attribute, brightness_show() will call led_trigger_is_hw_controlled() bef=
ore
> acquiring the led_access mutex:
>=20
> brightness_show() {
>         if (led_trigger_is_hw_controlled(led_cdev))
>                 return -ENODATA;
>=20
>         mutex_lock(&led_cdev->led_access);
>         ...
> }
>=20
> Since led_trigger_is_hw_controlled() eventually accesses trigger_lock, wi=
ll
> it attempt to acquire the uninitialized semaphore and cause a crash or
> lockdep warning?
>=20
> [ ... ]
