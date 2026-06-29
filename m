Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0D3655D5;
	Mon, 29 Jun 2026 19:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763197; cv=none; b=bjEgdhK6NUvVfteiaSabUPGvvFo79+7nmRbc8GWFDTBv+gBD4JUrmZxJSjF14GUuphGJosBvV3EDYoa92AOJnbQujBOhGcCrScvRDL4JemnIuiFKYjkA2z1sgtLjfUk19j5C67UehlArPBgjBXL0uVVHd8y+oa8u8VghllT/zrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763197; c=relaxed/simple;
	bh=igg3V5L2OZiYm9DkqgudJ1YKQZ/Y4akRTijLfeXXDcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NDlx53eQmVZYTPqimMVpAka/cX6VIVYzk+awaM1Dg+2kk+VznIrknD7+R0ywj9WTc2Tl2iv/K/iHWFHpCs6wcSgUbdN8zEcFYe13jIXZQNwbYDCYuBdLAV1Tt+TpZmJzsNQDzvb4r0rJP07ciHxjTnsGw3HtVgMUWwA6pI2cQ3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+MifZF1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+MifZF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B594F1F000E9;
	Mon, 29 Jun 2026 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782763185;
	bh=igg3V5L2OZiYm9DkqgudJ1YKQZ/Y4akRTijLfeXXDcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+MifZF1vcNvwskr2pqX5DivMpd/QpIotQRBcf5K/r2a4b4NkbKa/hM9QDXcFlDkf
	 N9m7MQuRyqvH40dDEDtXvfQ/QcnSq3UhW4Vhk5/trI+u423ahAQlPdFixkFBuROAjb
	 UPG0+SW8C7/h6ZaQevo+EHQHe5jQcz0oQXbTwxpGtiRChF9y8d1NuNkkd3e+OSAcvO
	 68RnEfprUCmgtIh0jkn9Obbna6Ew7Dqq73OgbYuvJUHmZDJpleRiq3Rrpjp+XT9Asm
	 PMKPAEPd5TcM5UQ6buvTBgavG25SudhsscfdyJCSVsDM7zN5TP/Lp/O2powYfvn4kv
	 9VWL180U1Ip9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-2-0cf7c0a7dc14@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:59:44 +0000
Message-Id: <20260629195944.B594F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-monza-leds=
-v1-0-0cf7c0a7dc14@oss.qualcomm.com?part=3D2

