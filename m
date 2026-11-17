Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916485;
	b=sm2dqB0a/knz8/TolhAxICGWhimln/MhdSjbIkA78leGMJPlXyvYHR0b2K3GEVxHS0E8
	 ES8UJNEM4pSsZZ9I3BJdug7Y7BOeDAlrJbArZJH5J5rna48vrpTjlwmCd2im/4UQ6YoZg
	 uXrbTecK395wTXJz5OmpU5tmZZV8a1UrxniFVvOHMe6beA2VnMkOa6iHHgLnOYuiq4tbq
	 W8Zl4PUiOQCcJOTBmKWHg7RX/M/5D+ttM4RGPs9O0e6hQiv2mcK7CQWFXQmp/AQuXLEUG
	 86hmpZyOtqDEJppwTH3Ppw6r2RjqjoptL0MoX9XPCsj3a+HbqrYBTx3xNNEnLXKpLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JstoL/jDaMV5iZFppieow7WNMDM0sK55wvWa1oVpNFw=;
	b=OW+Ar5PG0AreA/afFZZbTeciCgbTMUe0MNT/9YNEMKcscfLkyFzg1Osh99ZpWMGLXeya
	 zzLG2fkyFUKx1Qtq/TQXBanLTTeKr9iUz5IABIaeB66A1lPX+4pCEFUl3p13Y+ECPYgVl
	 26BxgAlY5EoBEmDlaU0gOjPgCKyGNQhEKQSaid1KQmq8L4alfo2wJnR3podpDLn3IzEkQ
	 8AX4vcJ1V+ePoH4iU2HFLQ1wpgYhr1pRjcQ8fZgdCaYSdrGh81GmzE5qvW/E0SQmIsOc4
	 m0A5pNKSEGf61NtGhfX9Nz605Lzq1tE9PaxUpBwiJmEufgPtcqp71jVKfjmgpgpP5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkQy75G7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A8C606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VkQy75G7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD08E1F000C6;
	Tue, 17 Nov 2026 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916484;
	bh=JstoL/jDaMV5iZFppieow7WNMDM0sK55wvWa1oVpNFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkQy75G7IxlOhV2omUUuWlKaGuigvvR1AXJOE2AxR6ej8IJ1U38Yg70EFDm8qHWqx
	 Jy3ayfv4VCRcQZUWdDVSoliu0z58rlXol76Vss3jmirvJEBlKSzeU3kG3il9uqfR/q
	 5QRgPKvKJ25TpCUephHUGKyEQf/FzylRayjfztkucg24Qls21jxfizjOZuvBTMmyZ9
	 jvcks3OgyW/pjc/0MINX7Q/D5PgHNxrZdKXuMdxwmbG/OAUdjVB7A1WbG7azXIcrW0
	 Ve0foH9zkA5BFyjFUnlbEo95mRaL1mszPKUep88HQAIMdtGGCcsnMXkkJQcpJjxJuI
	 weQ1YuqN9DhTA==
Message-ID: <sashiko-outbox-218740@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended
 register write helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117114432.2794961-4-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-4-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:54:44 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add dap8211r_write_ext() to write extended registers via the indirect
> access registers of the PHY.
>=20
> This will be used to write extended registers of the DAP8211R.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117114432.2794=
961-1-a.shimko.dev@gmail.com?part=3D3

