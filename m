Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312D3A7F5F
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934261; cv=none; b=SXuuzwyEckSPVFW1jJysbDfnCfgFajJ3tvjwwlLZPYQe2vCVENIGfHawCsc5iSyIAd1ZJZySOYErHuuE3pss10PNDc4gy9U3WZ7kq2cZEA2OT/usafXeyKF9blWO2ldCXFXcg1a+iglK3sP5JgWrLY7v8LgRaFwtaCJlmVQ74Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934261; c=relaxed/simple;
	bh=cI12ea4bJVY0t0PmBPDjquoLTWgsXDsaiFgVUZ6Ih9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uxQxfg28uTkC4wgdaJKteVNstfeUq/HX9Vn5EmCi4zTZr3HK/FYQRL10+8RWDfHlNQg8uFCLmIrMkF1Fl2Fs+8O5fQ6UvvZukVwH3w5CkjE+OkL0TYav2kkp0SvRidJHGIhEA6Uwy5WYBc5MWw7QOV0a0PAkPQmU+jmH19NVk5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XR+o2Yzn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XR+o2Yzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13E41F00898;
	Sun, 20 Sep 2026 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934260;
	bh=cI12ea4bJVY0t0PmBPDjquoLTWgsXDsaiFgVUZ6Ih9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XR+o2YznmbtPdRIdSHo3iO+xsLpIfF3aEfvkHfLL5OqIJKqR4g1JmmYMt6MpEih7B
	 fYPYDm5T8NaWRfobLZzkkUKSwiHwzslglFgT9a6urN27mFBbs7G8IoSZA3dQXsQkuE
	 WaJFiBootVaz/yWYJUDoEU1oXCPO9+F76JxE1en5RR0nsCVP6TgaAx/hSDqY94uZKB
	 6F9OCJXBZsph1DD4toyyCzhR4aEifA9HnVDpzmbKIY9vLF1AEJ871lpLKMRm6JBumU
	 97SkqGvykKaZcFji5sV1iugItf8ZwLTuflpmJ9N9kgYgRTcu7xaI46uTTvzXyjYs+e
	 OVfObb88VjJEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/13] leds: trigger: Add
 led_trigger_notify_hw_control_changed() interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-10-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-10-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:39 +0000
Message-Id: <20260920195739.D13E41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Some hardware can autonomously activate/deactivate hardware control.
> After that, the LED hardware notifies the LED driver. Currently, there
> is no mechanism for LED drivers to notify the LED core about such events
> and initiate a trigger transition to reflect the hardware state.
>=20
> Add a new interface called led_trigger_notify_hw_control_changed(), so
> that LED drivers can call it to notify the LED core about the
> transition.
>=20
> The interface only allows two transitions:
>=20
> 1. "none" =3D> private trigger
> 2. private trigger =3D> "none"
>=20
> If the current trigger is neither the private trigger nor "none", no
> [ ... ]
> By default, the config is enabled when LEDS_BRIGHTNESS_HW_CHANGED is
> enabled.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D10

