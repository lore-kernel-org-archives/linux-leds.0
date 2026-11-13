Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601886;
	b=bM6oKYKvYU9TMymy0IVO+fd00hSs4whUUmkt+htd/TdwLrul1P8e2JZOdMZr7z9TpJ/k
	 /Y9wmhVLAOuhOPLGyebBuoS9fv5wszfCbn9ZKf3kiaSoQ3jHWi4DA29IgOdRm/skP3yip
	 /vdY8qjkJ9nXoZnsqhRQWjjRf+m7U6puLPsO6KAjRectizanEinh0ioKltepyn2UI/b7P
	 yqpvCbNHQhf3XqtNapqjfoWTpdV5eJhJDuPNU1sdgvqKLDptL2WsNeZfyq8MQFzWaFkF5
	 mRRVRsHuR3F4mSxrEE3YtatxMPn5dfdy0cfPn1uaeZNYMMas152X6Sjorp34FyzXq3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601886;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FNJ7P+6R6CHk4Yev4bhWc4MARE5OL1Vc+E1gQjPygMc=;
	b=PDDAaHhjbibk5M/dgjvVQbVyB9RjFvLhxU/M88KSHhzJtKwytM4OdKgtkVdAtutWj+2e
	 XWd9gTJqTum/jlDOZ/E2qz9ro0QekbUYE8WUEG+tkdKGrjSBCaYyEf5UBo4sCG69tkjcp
	 k4y0geOqk/1mUM9Zqx2GGNBYUObjXDXwcB2cA50BbqnssCAURBT7LhG7xwyoe0zQoIlQT
	 3Kh4XMzXwNTYGi8TH5yn9JYB0Gn0Y4+MtX7ajXZPD84PIlmeG+UAd8GY4tjMszjjyyMsB
	 4b3tLTPabURpjp31dTmyTIAgA/NQiu7K5N3iHnzBtCLx38aLnI7axZS4NSN2+lIivaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIq7QQxL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DAC606A331
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIq7QQxL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14A51F000C4;
	Fri, 13 Nov 2026 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601886;
	bh=FNJ7P+6R6CHk4Yev4bhWc4MARE5OL1Vc+E1gQjPygMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MIq7QQxLgwnNKDr0CSkmbcrnYE4otgYHZ7LEcfA1f1KaIJuzihZN+3sDzHxENCe3F
	 Jg/zDJuxinB4RUrEpNnlmw98qjDGcyarBDLRGfWh7Txulq66o1hMTL4eO3pkivHawa
	 lPKfh49ca5+kihvn4Tl+DBHWXuxiavb8RsPveXguejaOIJRgsIzCIw/B8JzfqbR/ST
	 werOuoZFfT/3W8n8fS55O91Sl2Rxxd4jHx5rFRjDaMpNJElTgOh4DFiG6Mv73iVTiL
	 dBq70NvwtJYORrYdSMTNQl5BDbSNdmEkI61xZn/KY0EV6EaxzUd9M5DYtWYmPfJOon
	 B/SrQa8H0UXgw==
Message-ID: <sashiko-outbox-213646@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261113201936.2645736-2-alexander.sverdlin@siemens.com>
References: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
 <20261113201936.2645736-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:31:25 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> When hw control is active, set_device_name() takes a reference on the
> netdev via dev_get_by_name(). The register_netdevice_notifier() failure
> path frees trigger_data without dropping it, leaking the netdev.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914140045.B8F4C1F000FF@smtp.kern=
el.org/
> Fixes: 0316cc5629d1 ("leds: trigger: netdev: init mode if hw control alre=
ady active")
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113201936.2645=
736-1-alexander.sverdlin@siemens.com?part=3D1

