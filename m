Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515137;
	b=5hNixAdzPzMjLCMZpiLHbhAoH7K1j7XcefjgdZRN3UGoyWzsR5JuUf4NrYirFAwWWZ1x
	 BdL5UkLwPKMyx5F/gIDawijpmJ54RoiG9VJGzRacuW/g39e9jXDozinsziO7f5ip4jbJe
	 utTrRk0ceVKS3CYTmOlmFaNuzl70JC+J0jwdxEYsXjoTImakq8WSowjqRZR/T25l2OFzK
	 iOBrsB7ie+nxSyaUohYRUDGcVQz/ddH8JuRgGl1elorkHVviuvEWnd/ZejSKiX8oaOvGx
	 3gjLlKESrX+PFynmQ+qBo6VGSogd9/qKwP+OjSJ0LQcwilgMhiMWgK/Z6Fmh60mSiOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jl+IafUF4iR+ayEOLyYs6cM7eXUS7l8oUYu3VBn9/p8=;
	b=tFxTqB73UGw42y5siXZkv8iu2Nm30i8dIJy/k7VBXuh/wCsV4wGd5/TfLbdfA4dPx82H
	 UAQ9TRkCHsaJ0lDcd6MY7rh4MMN3sKW4NOUJoPwZdjPoVwKRwC1UcJsL0v+EcsFPLbBSM
	 v7l+QSjeZWlZ2TT/+Uw6MOX1ebkiLFwem02C32WN9R5cGoXBUQQueYekzjlSnNIRR7pzi
	 Nrzp303LGRj5djgWD9GaElb9PGSoRg9WaHEpHSCbULMTxeFZXYiZMYX+2O2RecpsD0iiF
	 0/066CUmttGntEOgUkyD8R8rcCiaKu6O00ui5FaNmZR9UeDyMhbCTdrRyukALs6UgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QglMwo89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F93606A322
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QglMwo89
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1231F000D3;
	Tue, 24 Nov 2026 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515136;
	bh=Jl+IafUF4iR+ayEOLyYs6cM7eXUS7l8oUYu3VBn9/p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QglMwo89SPT5SUgq5hOn93l1L1lw3+4FNNrhpYC5TM+n1noj2AzpGt9qS5xnJBAiB
	 uZdPtoxyLLjck10R12SxFkbkP3bS5LWFSsk9JipxwnxJ0xawwjuJ02iN5XlEH5ksoI
	 VSREYyixL0q6ZNd87W/YDwS3wfTb0YJIwJ8Yb1+r2ASddpJZGMeCd6Nzy0lUsB/Xhv
	 rd2wMQzgVN2bmjGllYkOWj9RCrKYetGMBGseCumSq0Wzfv1JVYGzjhbtpNDzDGzJS/
	 jdQxJwxci0+m8eSL/WAQx9TEzVIfLVC/D0Zw0ymQCoGvAHHHm+XP2ko4BbnT6XfqtB
	 sLMcWFJN9St0w==
Message-ID: <sashiko-outbox-230941@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 0/3] net: phy: dap8211r: add LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:12:16 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124094914.2993=
988-1-a.shimko.dev@gmail.com
