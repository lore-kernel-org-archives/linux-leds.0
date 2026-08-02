Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AC22FDE6
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691909; cv=none; b=WyTNy32h55QGbbSlomIv9Z51jdAzHffKkgNrcTz0T7nzMU8sNJQLjTo2IRUI6zsfA0ngX4OaFgPhBb5Qfv0iL2CxSpIn0U5dzjLeFWrk4sfJdnnNFVI3gd4cNPoXHzlj0byAXc5F8LhWxU14MwuHDCxGzW6D21jgw+Cmfk37fBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691909; c=relaxed/simple;
	bh=/YnHUt0oeO1m40HapoH9X91MTGNJo8cAs2PX0SEpUgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nGd2ONUH6/gZh+8Ggldhm6jZI44t9/1Nifjtk9hb6bF3t6bIhfQRRx6NP69HEqYlDoGjGdoFo1lOnb0WGVsah3kjhbgUkw1ByQTuq/ETNUPGUQUMrLsgv6e1TBQ9UFDKfrfgxB/cWoP7V9Q5PZUugVuAkuW/7uBLxqk1Lz/jgFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISevkXSq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISevkXSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958501F00A3A;
	Sun,  2 Aug 2026 17:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691908;
	bh=W9mYR70p/9kd3irxFIj1ka5heoDd6YhhW7xNbbG+r4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISevkXSqXmeOFL7h1vYaaVIKl3Znp6N3sXs1Qo74OiG/JIdmnv4uWW9TWEwKyfKFm
	 HCYItHZe+vIJKNu5T6L7eYxkEBbdhG7L4ghZ6fciiCdRbkbbX20EaXWkyvtTwBv+u0
	 PV66uPeLNmivxvnd0dy8CC4T4mJTVclsLcNIycoxaoWK8cu7ksu9hG9c4DV5Nvhczd
	 HQSK1kO7CKhmLAOuqBZrx6wkGoYWZtyFXTZgoU8lebKSS3p2NeOmNValHnVVjjOcZc
	 fRpwsbZxAvWZNv+oJKxkuHSTFNOEMlMS8RlaCr52VBxdR5AGG5fTiOELt9nwpQXobi
	 o6VHhQ1Er6pJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] leds: trigger: Add offloaded() callback and
 provide trigger_may_offload attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-3-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-3-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:48 +0000
Message-Id: <20260802173148.958501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> There are multiple triggers implementing hardware control. However, the
> LED trigger core doesn't really know the hardware control (offloaded)
> state since the coordination is done directly between the trigger and
> the LED driver. It can only assume private triggers as offloaded and
> generic ones as not offloaded.
>=20
> Add an offloaded() callback so that triggers can report their offloaded
> states to the LED trigger core. When unimplemented, it defaults to true
> for private triggers and false for generic ones to keep the current
> behavior unchanged.
>=20
> With that, provide a new attribute "trigger_may_offload", so that
> userspace can determine:
>=20
> - if the LED device supports hardware control (supported =3D> visible)
> - which trigger is the hardware control trigger selected by the LED
>   device
> - if the trigger is selected ("<foo_trigger>")
> - if the trigger is offloaded ("[foo_trigger]")
>=20
> Note: the documentation describes the attribute as "returning a list"
> despite the LED core currently only supports one hardware control
> trigger per LED device. This is intentional to make the attribute
> extensible in the future without breaking userspace.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D3

