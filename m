Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBC3C3BFE;
	Tue, 15 Sep 2026 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482768; cv=none; b=PpMeO4RzqtDBwxlp2VoR90XkpjQcak6c9VprQKaHDRb3TkHR2MKp03Eaja119me43Jbfi2+9GqJbiCNBkqE5cN850lwLiUnVEKFhefOt/Y+x4Z0PMiP2QGAKXNxkLI+CHdCm2QodJD4wvT5gW8obM+FlG/y82JIHeQH3kO+fNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482768; c=relaxed/simple;
	bh=b5Ko5TP2NVbLZZPjGEzZO7Hep92E4lqhC5fOphoP0A4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZkmRrWBE6T/tfl1dbWrfdQ+bfZ8+Emz1o2UiOtefGcjzvKtTPwW9WwlpAAfxSNZ7kYWdoRrOb/c1nuFt9tcfq83ielFlp96A701d93EignvWX5QVeNnUsO5Q54z7e6F9Gwz3WWr3ub6F5VwUHjIzwXznlCw3tRt9PQboxs/fYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUQzYiBi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUQzYiBi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3C01F000FF;
	Tue, 15 Sep 2026 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482767;
	bh=aZWJwhqD2ihL3hzSxsGY1HDDTY49hLDKhlo4ZZAdrmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUQzYiBi+0CAFtVOGIIG4DSeSd6aqfXL8pMPM85LhfursEQdaHdy1UV08hgCt7N8Q
	 JxZuFIdMO4yCyZBzMG5KJwoIZH+VJprpBcy/CPxIHFnDw+I4nbJT+vyv/T575bj3AK
	 IfaXZuFaz/SkaePwQj38pZ2yRYJ2UMMevob4PrWnxa4II2J55WzxwOSW6Dp/xsafAf
	 7gS9d8sBPSLhKEVwnDxX7IvX5LuBjC3zofSUqufGf26eNnA4Et+fQM8Zg3rgFSXzwC
	 eWqWlHpRS6q4zyWWVQhqYbfhDiSUz54GHi12I4vjE55KSUwkcMHCoqrAjsSc+5SjUj
	 odndL9ZlyhWYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] leds: pca995x: Add support for group brightness
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <bb9d86b8891d58eab135038dfde70ae024f244c1.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <bb9d86b8891d58eab135038dfde70ae024f244c1.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:32:46 +0000
Message-Id: <20260915143246.CF3C01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sysfs: race condition between LED registration and parent attrib=
utes creation
--

commit 519bef49574c49d4cda0dcf149ce7b8d6e09657e
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: Add support for group brightness control

When LEDs are set to PWM mode with group control enabled, their
brightness can control using a global "group PWM" setting, modulating
the individual LEDs' brightness with a second PWM running at a different
frequency. This patch introduces sysfs attributes to expose group
brightness control and clear error flags.

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 963e453ce117d..33da3cd9cbbbf 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
[ ... ]
> @@ -190,10 +194,41 @@ static ssize_t has_errors_store(struct device *dev,=
 struct device_attribute *att
>  	return ret ?: count;
>  }
> =20
> +static ssize_t group_brightness_show(struct device *dev, struct device_a=
ttribute *attr, char *buf)
> +{
[ ... ]
> +static ssize_t group_brightness_store(struct device *dev, struct device_=
attribute *attr,
> +				       const char *buf, size_t count)
> +{
[ ... ]
>  static DEVICE_ATTR_RW(has_errors);
> +static DEVICE_ATTR_RW(group_brightness);
> =20
>  static struct attribute *pca995x_attrs[] =3D {
>  	&dev_attr_has_errors.attr,
> +	&dev_attr_group_brightness.attr,
>  	NULL,
>  };

[Severity: Medium]
Does this attribute registration order create a race condition with userspa=
ce?

Looking at pca995x_probe(), devm_led_classdev_register_ext() is called to
register the LEDs, which emits KOBJ_ADD uevents. Later in the function,
sysfs_create_groups() is called to create these parent attributes.

Because the attributes are created after the uevent is emitted, udev rules
triggered by the LED addition might fail to read the new group_brightness
attribute because it is not yet created.

Similarly on device removal, sysfs_remove_groups() is called in
pca995x_remove() before the managed devres cleanup unregisters the child
LED devices. This causes the attributes to disappear while the LEDs are
still registered and potentially active.

Could we avoid this race during teardown and initialization by using
devm_device_add_groups() before registering the LED class devices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D8
