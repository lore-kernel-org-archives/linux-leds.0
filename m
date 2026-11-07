Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025926;
	b=RlW3aO9ZlCV+qDwFcCldg1NzASQ6y2OGGnpNkHDSoCGwyq2wET163xIdgz23smmMfKJd
	 jHDzRk1yF2A4lCs+1j1u2K8xLLDerrUly+Qn+zoITfF5ZuYus65cSO0BbK/Kd6/80MLuu
	 dD2DZPC7FJFBSD2MlvcCw279/PYPeShey6bqhU1YkOf6tpV3YV94oyg10VBBSOCzDvwQa
	 ik4Bn2XDWjo4bTlsz/90XCHq6RsUHFnLttCwJcC/rFEnoGbi51tkCfrzho8C+oqPrZbSu
	 pPWiCTjZ7lDuotO1P+mapqdk3jXvWwcSJwMH3bmGc4Z1UECsw66cScyt8EyGiov5taA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025926;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Oqof8dQVPX1ZCHqZmpyig4fg2aXjQR6Hz5blAmvkrqU=;
	b=dN6sYxhTjqaosFKYtc0DO8f74hrppvqhXLXS+LztgoCqcGmLwl4iSdbShewkAWWuMjeJ
	 SzUA2Ol3s1U6vykUj1hqulNKitxs0CGDb/7A6ybNWmY32dhnavXDxu33FFEuxyEsBqQWP
	 L3j6l1qoZF2X73mbbIz48TLbL344z7ZzeWwaZVQrisqW6IQfY4/5t/ilVbWjxKuf/Bkh5
	 KSQ2H2MgwEIj9PD2ww/sRwXj0bM6oG5E3Szo+qX1HoeEzSsUzRBwPc/i2tBWM6z7Duaft
	 gFm8GSmobRRTDqWrQhJJrWmOzRprRG/4iwTqWVDJ5Fwwkv/+dylI3LErx/vkRoHHWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2dbHnu5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E30E606A32D
	for <linux-leds@vger.kernel.org>; Sat,  7 Nov 2026 04:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2dbHnu5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D4F1F0089F;
	Sat,  7 Nov 2026 04:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794025925;
	bh=Oqof8dQVPX1ZCHqZmpyig4fg2aXjQR6Hz5blAmvkrqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2dbHnu5vSRjQ9QTcLP4EieXxQ70YdMuNd+SgiGdPKvT46KbEC+pq46mdEmRQeYQL
	 89WvtaP9OfhxE59S9TtIk1EeT85R4CGw19kk1ATDPBG4JCAdlF2LQLxRRQrZN1ERC6
	 5XY4V8To2jkMJx3+qMhVy31xEUzUzj0Kialvuk5+9d02mpujmiiC8J6kqD+j//wP2I
	 qkMNYYQfTiaMYInmJn8uUveVFLgkk7tkR9dRiopT+q3vm2yjSeGLZOImEDF7xSJcbC
	 BbAKrtgfI34QSRPwuiQ5qBF0kWIHjgkJCVHhTFFku4M9skgtKVIgzVMwCkqN12yV6C
	 LhkG1z1mc3gbg==
Message-ID: <sashiko-outbox-202585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: netxbig: Fix platform device reference leak on
 successful probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261107042737.708109-1-vulab@iscas.ac.cn>
References: <20260922160323.GB3438784@google.com>
 <20261107042737.708109-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 04:32:05 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> of_find_device_by_node() returns the GPIO extension device with an
> elevated reference count.  The error paths release it through the
> put_device label, but the success path returns directly, so the
> reference is leaked whenever the LED driver probes successfully.
>=20
> Release the reference right after its last use and remove the put_device
> label and the gotos leading to it.
>=20
> Fixes: 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors")
> Suggested-by: Lee Jones <lee@kernel.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107042737.7081=
09-1-vulab@iscas.ac.cn?part=3D1

