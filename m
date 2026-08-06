Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531031DB13A;
	Thu,  6 Aug 2026 02:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982287; cv=none; b=Ddilw9KMqa3xWIY4iuqVaylGCGqolGB3rE4jUjuzglhomDHYgE7w2ahq6TxTuyzpL6jgYukkJmJBzd2bDtg0yvgf61JoJmmKJuPW2asjBImR/1PNcnR3oPmvCZUvY72AwKRYKJoZhqkMEnSf/TkhtS2Zc6zgNjFA9lJ9JO0RRu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982287; c=relaxed/simple;
	bh=iRpKpypPBARvJg3pQarD037P6cDoXyeQ4NA+E1RL6wI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AefZoHYUxEMeAZAbgHPzwVU6C28qZygPnJmqKTTpkv3zQplbcpQdXGMq4pvBPmQQe2Q0Ha7TSD+6Fhq2A1/HkW+1wFBltKc63KOJlLmAEHHoizNZs9A2VjLjOtmVqXKrHtrel3FG/+/rDrGbiok2vn1RutGEzZCBhe9k8KXqOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bezSo34z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bezSo34z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991571F000E9;
	Thu,  6 Aug 2026 02:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785982286;
	bh=iRpKpypPBARvJg3pQarD037P6cDoXyeQ4NA+E1RL6wI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bezSo34zcb4lDpiJipuWJNL9XVxL6Q2yR/+KFpPmAfm7yclDt9V7FOwL5L5+zIr0b
	 eHOQCA2YhMRp9665pCbdiUKfxCc3U33z20PhQplB8S8lWaHrSue5CUNg0uGX2Jgz5L
	 idQerfywdVy1yBQ/KwjjF+Zx2RlZIY35bN8xB11JfLkIdUO5Y5bE1h/64EqyDcLTYd
	 Ixw0NOiqxrxk8BEt9Mo6ly/chpbd2antVpvve4IEQFjE1wrXhJj5Rgzl/R40Biykq/
	 Sg8icx2NK5L+ZjkPTNYG24LCWvZaz8IY6+DOJxKidCBpAxMx6lBUwvehegI+1MaZcp
	 d8fRmoUYgHdSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-upstream-ltc3208-v9-1-c746e872c193@analog.com>
References: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
 <20260806-upstream-ltc3208-v9-1-c746e872c193@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:11:25 +0000
Message-Id: <20260806021125.991571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-upstream-l=
tc3208-v9-0-c746e872c193@analog.com?part=3D1

