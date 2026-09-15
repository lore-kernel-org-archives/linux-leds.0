Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B353B27FF;
	Tue, 15 Sep 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482172; cv=none; b=YKoaoF0oS/MU9FMpPsElfLYLxMfPVHPmlw1U39sue19NfDe3lsWDdqO2i2sWRt/2uiaR8xcNIlU8XoydttnZG5OmZ9ke73tpO3f2XPhKEQsgjLQWfdmJDmJlDjjfGA+2jTr8Y3CUvxRuYMly9V8zuRH/AW6shyDOA5Gle0PRp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482172; c=relaxed/simple;
	bh=fgVt/5dsde/sFsnl/Z5BHs/W6kXFMIkRnyRjLbAopVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OOYIHbOfvrAcTCFdwGnT4bDFAdsVpN7j+NTV1zfJK9eSwBO6jHgxU1LLhwOBofLXAzM72mR34UNM7lQmarGTFpS4kr7u631BVcrvLofQHiVCVKCzcTZNg+s6lmUg5Z7U83Ll+RZSqGpi6c/e9Z4QtUMSwVW+IJ0yB6igIsF1AmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7BM5HAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7BM5HAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3041F000FF;
	Tue, 15 Sep 2026 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482170;
	bh=fgVt/5dsde/sFsnl/Z5BHs/W6kXFMIkRnyRjLbAopVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7BM5HASeJHHeX2xv5lz61BihJvCdkvsXlFBBrZAcjzV2OTyFMSL5Az/ch25gBw8w
	 UNyt74Gs4kxR0hlEy9rNGNpE59Imbxp8HHFl5/FIEVh131IKJ+dmheDJDmQVRF1B1J
	 ZaFRodSgNzx+Ngva4ruEVlVW+Eq9b5iSPio5GH9tYl7Z6EagLVDT2+XpVPJF1qqFBF
	 37v6l/nUaHgelW49AeuNGaIRU6oBtj5SbalJTJI8h25Lhkk0JdFUEqY+e/3VQBOeRM
	 q3C3TaFxjK/d50O1fmuMswvWENG5o5Ls6vGZkWjC4mZ0sC4fYTXHpMDanZBFzkRs4A
	 yjOHwS2U9HoVA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] leds: pca995x: Make output gain configurable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <6b65d783052e84fd00c139a3b3f85b04f680b798.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <6b65d783052e84fd00c139a3b3f85b04f680b798.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:22:49 +0000
Message-Id: <20260915142250.3B3041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The output gain linearly configures the LED current in 255 levels; the
> absolute current depends on both the gain value and the R_ext resistor
> connected to the LED driver. Make the gain configurable in the Device
> Tree instead of hardcoding it to 128, allowing to adjust the current
> for different hardware designs.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D5

