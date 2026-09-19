Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D191C84A2
	for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2026 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777324; cv=none; b=cYMqTXVZIkZWfz1umBCrW1cLZx5X44rfudHhtWqTC5PPLwSaomHhamhNRD6tMaHDnuZVgbvnf9wHqFVUMc6Zw2NIf7NgAynJ4n38LyiLVsI53fa5ydpYdZbtaAEHkjDBfx7VoNH5HDAUagy1BuiuxeZefSP4YvHNaZdO8da3p3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777324; c=relaxed/simple;
	bh=rNZjkFG6ZOBSyNVsEAGNMoSQljVEvDkTAQVrfdtRBuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CR4cioCFPT2akUsZ/0D3J6zU44WPLAgHLvMZQayHXhQXA+N+ZG54gRb0wS+vqCnLjlYsy7pIO6SVjRyhbPukXDabY1LBs6jmIqwbTfHCCP9Lp1KTcZVxOK0eWpmvWwpsWTWwUv5RATOos5lLQfruLdNqDSvfxjcwlrHb/MZL3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moTnFLyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moTnFLyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96461F000FF;
	Sat, 19 Sep 2026 00:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789777322;
	bh=rNZjkFG6ZOBSyNVsEAGNMoSQljVEvDkTAQVrfdtRBuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moTnFLykuw0OKEip8cIUgOYRvq7l/VZEgU6F/uE2DtsTjAoLvzt4cRN2bvKiBelxK
	 RQU5jiVbZnJesC7eruyUSS6DCcqk0y47RxYF2ioHutyLIe/Ppf3dx7sis/ID+uV7E9
	 5+SqAAW1HHiwuS3nxYUrHMNqFW1TTOC1yhxN+bjx9Ux4lAGwDjvFKsvt8UnCAyabOS
	 gsNKiTU+cnl9qNuryR8cIv0mMjXOv28pbXA9lYSACrlkkjaS4+9XmbjL8m515I53Pn
	 vtp/W+yEZeGDRk1Db8edpwNKmterS869W1bLJrR9muas1m7jxiPyZQ3x2l8tETfK7w
	 am2EH4IWDdNcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260919001331.720072-1-rosenp@gmail.com>
References: <20260919001331.720072-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 00:22:01 +0000
Message-Id: <20260919002201.C96461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert LED and channel parsing in lpg_add_led() and
> lpg_parse_channel() from DT-specific helpers to the fwnode API.
> The probe loop now uses device_for_each_child_node_scoped(),
> dropping explicit node lifetime handling.
>=20
> Behaviour is unchanged for device tree: fwnode_get_child_node_count()
> and both child iteration helpers skip unavailable children on OF,
> and the fwnode handle is passed straight to LED registration.
>=20
> cdev->default_trigger is only assigned when
> fwnode_property_read_string() succeeds, so an absent
> linux,default-trigger property no longer yields an uninitialized
> pointer.
>=20
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919001331.7200=
72-1-rosenp@gmail.com?part=3D1

