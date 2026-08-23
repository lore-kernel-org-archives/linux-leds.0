Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53783328FD;
	Sun, 23 Aug 2026 16:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503265; cv=none; b=bevXv8ncNTU1U7FY9WDGpid05Vp5djVOQjCv+sO0qigGyW/VqPeC6IDn0WFEy8FkKWRFBvWRW4FdY6HThxHAx4zRSwQTDka5Bbn8ZtEpMKzQ5/9SxiHVtPjM1I2l82Hsgq5S3IqfVLyenSFMA1LvRCFsnw8Fvmex7ero776d09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503265; c=relaxed/simple;
	bh=yDqnmARNUnwfaW7ohB5dxpX6i5Zwd3mPrzEq4ML4F/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nNzIgYTC+TbWBxFSSBQZaIMA36e2OBUE3J5R1MwchIry3mVK67Zq//d2Kik0OCBDY8aJPGi/B25zkkQ01Y1OnytcJxHFMbQv5waofHaLAhL2HJonhjZAqlRHIkEF8YacrVQ7WesMkHf6odTiPgpyWIyUg6ZeGKwLzpT4snXK9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqWFE+9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqWFE+9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BA11F000E9;
	Sun, 23 Aug 2026 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787503260;
	bh=yDqnmARNUnwfaW7ohB5dxpX6i5Zwd3mPrzEq4ML4F/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oqWFE+9ge6zSGEYOHY22Hiz5K8FUDKUGWdpWU7w3ML3yQeKO7I/HnlFoGS6+iHAQR
	 Rtc8Q1t7BkpSfDuJNASw8pa8RWNe2gBJILGi77VYTlBF16zbwmoTakw7txZFRoKpmr
	 hZezhaEpk+4MY1CPt60N2cQW9W71CvaxpdPXXvIGF4LkG3dNx/V1yV8JcqObbH66y0
	 EtOpNt7IsMe/jQvD0QwvNc8ESM7WRe8v0YZwy9TovfooiFYCU64pVlvbUYwkxj0m9r
	 lWl7EqK3IQZZhNgtfrJ1wfGZO2KIIPi0k5EsaQfLdSIG/ohYK3/Cm/PmYsLQuW2AA2
	 tFbfPVqzSKINg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: Add IS32FL3207 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>
References: <cover.1787502624.git.ahmadexp@gmail.com>
 <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 16:40:59 +0000
Message-Id: <20260823164100.59BA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The IS32FL3207 is an 18-channel constant-current LED controller with
> per-output PWM and current scaling.
>=20
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output and document their relationship to the RISET-derived full
> scale.
>=20
> Allow dash-suffixed multicolor group names when a group begins at channel
> 16 or 17, which cannot be represented by the common schema unit-address
> form.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787502624.gi=
t.ahmadexp@gmail.com?part=3D1

