Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8D4499B8;
	Sat, 11 Jul 2026 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798375; cv=none; b=enUnOtVNLXrrsf4F3sk7rG3zyKUFjmLbToGSCptZbJ3+p9VtCEaciSaDtF6rnkRZIf21SFGLprr4y7CRs9IEehtIQISgigVp/8uLKhrp+SS9Q3eqZxo468QZwmvYxKxj5p0mXnckafJbfuw8ibr51qqHWTbcPX9MOtzhWm81AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798375; c=relaxed/simple;
	bh=bwIalmVE+WdrBxLaFxLIdJUdOMskvXyWr/KSe9nizF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+4UsRjjHxQNTuVln6FTUGtqv6k8QUxOcbGEMz8Me95tym4tq4FUADlUBoPJxcsDEymigmEm33/Y5kfUcNLJufmpCUHA7yFt8xyUq3R1ntuLmff6PXCp0lKI4MjF0kCucM8rzllF71ToJxGNXIoRXO4+2dpTgW5/2FdYRxOtdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OeFW+hqE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OeFW+hqE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359F61F000E9;
	Sat, 11 Jul 2026 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798373;
	bh=bwIalmVE+WdrBxLaFxLIdJUdOMskvXyWr/KSe9nizF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OeFW+hqE3MkXeNjG8mwiGvAIFs0k7HlvxXBY4fOKuZMJebY85dMEPJAN4B9i1hj1I
	 u5fj0ArriXG1Zw75r88uNN99bUzAEYb53Y3dgyymPUukw27nS8yNN2lEXQmf/ACfVO
	 xj00/huRQQIFHh5lVaLVd5Bx1xuNTwB3fHYJeXXBflmfd+GMAkL2LOdnPA++HDnffx
	 O9/g6aPKpRGV/TKkwAUV81D1pmHCGpk2zNXtxfVW8cbvwCNcEHkKt8xP4+EWjoKATD
	 rDSZ+0LNeH/aT6xppF3QCXNM9R9ZMyBB7BSsPEUsWBBy6hXBeIFdhXyinG6RS2BnHn
	 iGqo/GqTA2zYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samuel Holland" <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 19:32:52 +0000
Message-Id: <20260711193253.359F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711192842.8450=
48-1-samuel@sholland.org?part=3D1

