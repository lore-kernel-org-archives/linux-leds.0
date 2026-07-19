Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D1A3AC0C1
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481194; cv=none; b=MTL6tgYDRFVXKRuAI3it5CN3QLGrOnmIzHUY+brdc1a5ti4Vea3FAsvdEETCqLX3YVPk+qLGkvDes0DL6DQ3Jd4d4Icr6nfgtKV+JSViUxnHDPv4WkZc+n6o5AfZg3WQjWnfgWO+xYLkzKybv0Un/+1uXxVurzIF/SNl9Z8y/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481194; c=relaxed/simple;
	bh=vRrND1SOiKvefX4bSlsbRklGT8i/MhQLEGv9mFlSn3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtXPC27vGPtTRbYlbkukmGbjQitV7leE5SRTaWaIwOoNwkjyHs+C4ec2Qv4RbFQRXRnNQ691L+ggR838sZeL/MXtoGTnhem43l09f8AUgTEVL+eFyjlOa2gMQc+1comNh9wNwSAdRL5CxAHSVLGfoDLMy76+mi4GPSlWSILlcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bi27/P53; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bi27/P53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A861F00A3A;
	Sun, 19 Jul 2026 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481189;
	bh=vRrND1SOiKvefX4bSlsbRklGT8i/MhQLEGv9mFlSn3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bi27/P53ky0xoeZUNu9fUWXkqncFCAa6LT8IUPdsdNFtRCh9+ORYI7/SvutCV4gRR
	 RoLMGXvq4K50+3RDMJ2SFGUb2EIcS6R4xHEzSymIOeetFTTPD3smvxUBmFlzwbZ0eQ
	 sbv/NjsbR65i4ZHibmAyeuJ6+qGTY61d4dKZp+TIWarmEY84ksmapEQhH9Zm325OI6
	 XSALJ3c+9QkNWnWhGl5USxuvA7R5bwn57Ji29rXfRg71DRIowKJM5zNbi9qFUQx6Z2
	 CXpTxmNbkZkyrf7t/TMkr1aytD5047F90Cvfgfv1W3dQ83LZCBEmGSTaa89whOPW6S
	 MgYlWdC0OvRKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 01/11] leds: Move led_trigger_is_hw_controlled()
 to the right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-1-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-1-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:08 +0000
Message-Id: <20260719171309.32A861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
>=20
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D1

