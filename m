Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F933C09F2;
	Fri, 24 Jul 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880180; cv=none; b=NJ3wV5b7E89Na/zA/FcCRL0Yu0FtMQNlpOKj70f5jrdvhdNJIDqULJtMe0CEdW0A0D9Nlw2gQ/KoSnwWOLUEe2o6/2Ud0WMa9Hbrbe1JceFGqgmZ2s8PHPHjGrcaFwOVULfgEuxZwzndEmsUMZ7+TlJnrpFoq7RlGov5ikoWq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880180; c=relaxed/simple;
	bh=bpCFPssoypOeMY0jnZ8NmH7/V5QyoJLStqlAJ06R0TA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PgGHSGI9wTKut059S74xrWqxyYSnZStKBEtyvk3wlYxqPMhYp+gml3KbniKOcRx4siCFslcjty2qG66u7jx6EjiIGP1wgHXsZfbh+TpGhg6+TgFT5vHjKLae5XdpLPav5tCTJ7aCxd2UhXbkty8rCpokBi0EA+jl99nwxnHJBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJzzmmFq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJzzmmFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7921F000E9;
	Fri, 24 Jul 2026 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784880176;
	bh=bpCFPssoypOeMY0jnZ8NmH7/V5QyoJLStqlAJ06R0TA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJzzmmFqLb1ewbJeg/kgZS4A26vOwdqjcF3R+wkBE6EhRWfDcpkShnQGnoMWZUkrZ
	 gZr8eZ5E2xzC50AYVfEwkTD6I/oqX/SpIwM1MWr9wuW7tEtareyUCF2Hr6Y6UW/Pjd
	 ut9Zi2bHgJ93Z6hZiDaBf6q/pS8Rdc3zfEVJjTldI3Kcxi7BT/KXgWYsAwvznuJHwU
	 4lxKPiVSJ1MybsxUUK6QY078FVbdrJNOMDo9arf0I0DceT5b6CwRP07sGqBZ8Pi+kd
	 IfsUfmuSSI9ouklbcGP1B0tQAmydOSHiE+KcFmZzcJ8FFjMFxJ7aYs2E45dbylA/C2
	 RU8oAWLIMe92A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-monza-leds-v7-3-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-3-0125a3bfea98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:02:55 +0000
Message-Id: <20260724080256.6A7921F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-monza-leds=
-v7-0-0125a3bfea98@oss.qualcomm.com?part=3D3

