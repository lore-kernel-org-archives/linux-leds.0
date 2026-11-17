Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900123;
	b=LPI6zkbe6xAtjuAbYYfUkxOBtAGlF++mdAAvD+i5I00u4+/uvK1OuVAXAeQ0pjGNxo/5
	 5TYMxpFAr8zylmgFAt/jszKIbXRffD4nOZMdsaCKAo9vmeU/amo2qYqoUmdZts7hA5jk4
	 I9VCJrrr/qCZXIBf6I8kx1/pHI0hqhlYrqTJxKErcxnujNpBtwHYKUEV8rxUjrPyxrwac
	 z+4SydYcoO8B3nqdiQfiZlAILna57wU0zNIChxk7KINaRQEiKgCswrHQgr3tjLtuKYfOk
	 4sFdmAcujwCHvbQ9F33mJsnjVR0+vOYJx2f0lHW9W106b/AXq9YBGsEPUr51xxpuF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900123;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tJFT8UPVRuquYb9EU9cJwvc807ZuIv9Fout9nAajIG8=;
	b=WT8wMSugj0mSwvL4G13z2S0PeB2tzniEyPlFXWYVSUHMLI3d2bpmvzZ0YPiFGWf/W3tm
	 8JJNs3RVJIeEVwRciI5VqDej4815ZVM79LrOLvFK9WZ+onO/XMfEs+4v7JMIHQ3D69MZj
	 2Qd/9qnJ7+qGLORhRCgigziIzV9G5iq2sjsGmI5GCOdb16FDu/97xSsnFiB1sUY4sWpTL
	 qUNfNpSdnHry8XuZlXpkk6pfQtT+daffnnw8LBDbd9QLtGVKEYF5yBse/CuidZA8LHn74
	 2+gRh4d3Tq0qZeISofkqLixPoA9CHFD2+k66Co7U/kQqzHgnp7jEwrVjQ6Y1IVkUK5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXxP7pPe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE2606A323
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LXxP7pPe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283D51F000C6;
	Tue, 17 Nov 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900123;
	bh=tJFT8UPVRuquYb9EU9cJwvc807ZuIv9Fout9nAajIG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LXxP7pPecv2tXzR92zfeb2LFIBvwcJVhpxLkTPx7cuqqavLiRfnAn4SgoFXM5Bv/2
	 eEGhxIUG0p3Zol9xRrIugmTQYnceC9XKCUXxqUbEUyQADjIYYoARaH8a4h57ZpzRqn
	 LNn1iVIfm25llAobOrDU3xlD7amNQ7nTgios/Z2MyHc2xFkh5C5A9vWQMoXwINjshn
	 30dVMxcE4HUPNKvc0sJOUsvzHp8EMR0m96MREB40oAx8daZpDLc/HPSQ+DS6g123UA
	 swn6AS4i3jgtz+vnVmUGlQ/cM1GJEKWX+pYLAcPq1cZunlKEkAID2puNB1fC7rETRK
	 CqOuFWKRX+ygg==
Message-ID: <sashiko-outbox-218316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117070518.26130-1-t3127430@gmail.com>
References: <20261117070518.26130-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:22:02 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Check return values from I2C register accesses and propagate
> errors to LED and GPIO callers.
>=20
> Restore cached LED and PWM state when register updates fail.
> Also protect the beeper PWM value shared between the input
> event callback and workqueue.
>=20
> Signed-off-by: Daniil Demakov <t3127430@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117070518.2613=
0-1-t3127430@gmail.com?part=3D1

