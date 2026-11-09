Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251229;
	b=EHQ8FeX5OA7jbA848W80Zimz7ayaUHmVCSxsYUT78fBK9ZbJn9k+8ihUZzw6TtVnB5EM
	 Uz0PpztUYj5+R61qJ0g5L5DSPSLqmVxoLe7Pay2Z2y/lCQIm+D9GnTJUvviOoM0r2iAZd
	 BHINMEfhvu14WC3UyuId62N0a+o2I8JTke+LaCzGzhoUk+l2anCAh0mwhiTpaVQ5L+Mxc
	 JafDhAAdX/QlhldTy8ctabV8EqtxhR/LN86fY6YtqhHzHT8+sSNj1Fn8W3VKB5tMt6WlQ
	 lHThJEr2E10gioOIUkCExnjKSxSsPQKg6dI3pGN6uy6x7leSYNTKJFchCn1LGzAomYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251229;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lcFt3T2iHztEmaR0r08mpKRJg4w5es39jZ7oWDDz6kM=;
	b=Oc+RF09AkiS1YzxNIh+o9DhfNHodBKRuORYMurAcAmJA9d1z/7UKh2R0BAxKPcHQs7Gj
	 0pmCK8UfVVCXIvEKHj8Rcu6ox9gRy0EhuI04vAEhJdJt2kaQO6akU85e8sZzArCD8AHSB
	 LVwSsNJNTQvj7FTX6FeRN5+9VGiKvpdvZgbx4dWDUjctaYg06SkaLbhZALooa3vXwZncY
	 kJGvVIdagjMjCaH/KDA1U2dv5xOuToC1H3lCfaC21FEfYrLUN5PxSirUIMwvgjRp353b3
	 X7Sl8vnjn7hOmsamI4nC4E0NDj/t5sQtP6rMUT3aJgc/ZVIDDp765RTKyuXCCE+mvtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqFW6RrF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DE606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqFW6RrF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1286A1F0089F;
	Mon,  9 Nov 2026 19:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251229;
	bh=lcFt3T2iHztEmaR0r08mpKRJg4w5es39jZ7oWDDz6kM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqFW6RrFUBKEIRZP0ph4IVUUZ3gkW6CNI7Bk0vDktoqDDLvA9V55fjY9Vu2DfZzFw
	 rEVpj/IzLyM5RwXPXxH0NIhWSFxDWRGdHJvsp2X1a/YE7so8R2B4crBsK6Wh6h60fu
	 Z0PjH3x15Qpspb0inPcUrZPxiWsUJxOOXQBrG9FgGrVi0k4IVGkVqBPgK+rlV0FuXM
	 8409TnWjTxLdRujWy10roc8pifFFCGvx4bYEOF3y5kywO+mb6WCQgLa9o4rAqccIA4
	 JQSFTVFt0xT26GpqGPwo9falu5BxQsR5oNr3EoobTjh5r4o6i3iEQphIBRQSpOVqoT
	 tRngUrtnoewew==
Message-ID: <sashiko-outbox-205456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/11] dt-bindings: leds: kinetic,ktd202x: Add Etek
 ET6326
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-6-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-6-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:07:08 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
> address and the current steps of the KTD2026. It only differs in the
> flash period, which is (Reg1 + 1) * 128 ms instead of 256 ms + Reg1 *
> 128 ms, so a KTD2026 driver runs it with blink periods that are 128 ms
> off. Document it with the KTD2026 as fallback.
>=20
> The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D6

