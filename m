Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797247;
	b=u9/220SQMb9UYpX9FT5ukb1K4CuNfXx0hKP4e6TGFzSaWeDrzbq4W02iLbgi0mgJTRYI
	 y088glLUqdEqjvmGH+GTIZWGzIOJIZMD4DgY0cf/HY6GmwVt7kZmkQRuLjhsND4YIWBuh
	 8R2VzqFLMbe9MU4nuJdqQ57fjKqHckMno17n4prWO57bCJlBliG7pXLmvEJ0mtWojluAO
	 RZeIQHsXoOsPSZae65XYVEJPNcyihxxRWyrYYjL4EKwzVADpoq4a9I5/85Wubh2MQTcO4
	 WuAO/YpDhMbZEvEX8pnaHLRw2vYdfkN9CueGuW5eVB5pfiLFKH9265vsiXctdXOXodQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797247;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Cn8ahprs3RaJAyG+U0wmKU9tL22BM3bndqijDLdfrg=;
	b=4GpC6DNgxLCrIgKwVQ0Dh10oxwUfEnfyKBx1t+WzDdMgxyjrjtZM00K/PVfiLT2iOJcN
	 pSaEojJYoI1y9lk9slTgKrWwFRtitvNeGi3luQe1VCIQQK9HBBFw4jgGZWHD1Tld884sf
	 eUFGCjrceCHv0bPkoGRkFgLHQayrDtsE9uJ8m26MIvSDmrtWnvrMqcp2CS+2xtWUXxHC/
	 cGAK/1WVClOl6GnsaKcX2ayfGr0hClQPe7QPzQAotHV2GGECWphkUpgASuTlF+UO/ENtV
	 WZuOIc880Q+bbW/hUDbZK++DWbxWba9ej3cMkl2oUB/0wrU1asL+xqaRD5x5llWvI2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTTuzIN7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46E606D809;
	Wed,  4 Nov 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTTuzIN7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C9C1F00A18;
	Wed,  4 Nov 2026 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797246;
	bh=+Cn8ahprs3RaJAyG+U0wmKU9tL22BM3bndqijDLdfrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTTuzIN7md1OVoUwJiCEQNUtRZdqjVmfWzEmblJBhX9NJtxstRr78cpWyfX1+kgZf
	 fJh1RrAaQ+FZqIHSufmZu9TGxImHg393RCK2emZdjXHOrwP7gVRmCjyFGB5VTEaaz/
	 YcGx7pN3ychj3NuJGpbSZ8otZoL7YlxXUcJaAgNVUGkT3ZPzCx9lTU1Vc7xBDaxKqS
	 mTYDMrXRnGEoaUOSXNas7TBt8K1LMA7Z0ntKTYeVQhegjyh+GVI5jV+kGj3VgoqxUo
	 lS2ulrOM89XGoHSuOWVNHCoH+a+pN5Z1bQsWeHKxRxaFs8UvInc6Mwkupng3mdqYKZ
	 7XuE2HeXLMVhA==
Message-ID: <sashiko-outbox-197317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104123714.234634-5-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
 <20261104123714.234634-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:00:45 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104123714.2346=
34-1-clamor95@gmail.com?part=3D4

