Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133757;
	b=km4n+jIt0BU8yH9+eVbc6mItrUBu38ZATmu0O4DM0mOjsySQSQxdnf2hbZ3z+WF2Cg38
	 lLyZwGsB5yZlPWNwZFIYrL/IoJlHH5mg1rYp0kHYIDiOzWgfktQMMDLVW/sdxD7nHBwy3
	 Hx1DYDyzjpqv44CqBk5uAs4brPZjkgKJQ9nevK74X6Ac/NvHxpgmc3hunXf0T8biTEQzg
	 4/YdQIjFYvp16OL2xgwp7Ql3pVhu3ikg7szdxC3/rS4OCUohPJzaLUwKVbfN3dMgyFrzH
	 +Gr86NvZ7hdt+dE2p+bUqf/ZWLYaVEjHbLvXlZcRr/xiux4RGTeV2spZCc48nU5QbIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133757;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ikvKm+apnZdZR8JWTFFZTpgUkiBN2SMfgt+5tuoj00Y=;
	b=S7pFsRUOu2hLV3tVL9rwlfp3b7+jUhmJrQxQGpUtJ8wr7sgeV/HvXyTLixYct/7+/kEc
	 KInGY0yuoq7fhBJmwKdnWl19fFcPIXW8z7XNowx1OOKJmzjEtvN8TmpQWFzTjWxZTQmxO
	 oS+IS+ALlv+fn7ptPK5OepurfiPmWyr52kXOYvymRS3s/wXroK3zOEJWakQzxBG9sGVVx
	 MdOQzjmDs24wblRczSl1lhn7cBeJBSPj12o/F7WKac0n8XACjuWq5glX5E7+QIHUTK1lv
	 M+FdVSmpHqDYTfCxIUp8eZSjkTimixtyHk44lswf0+O/k33LH5zGU+CE5dNXLIfkENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HI9NF3C7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D71606A325
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HI9NF3C7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E6A1F000C6;
	Fri, 20 Nov 2026 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133757;
	bh=ikvKm+apnZdZR8JWTFFZTpgUkiBN2SMfgt+5tuoj00Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HI9NF3C7UtOZ0vsCXu5INOmYj+UXkEpatnl8zUG9RrPcZS7NzI9u0uqwTyL3bm8LW
	 vofPhNyf/CQIFL3vp53Zv7trGSGnqFm+3kM5yO0Pq0kQaZbzSjAEBgpXcDd4kdgJM7
	 7wvLGkeUPP1LcZRcxEaKL9lwva4whibCyQayoKijHp7BAuOFnn3Y4FIto1zePu8KLB
	 JvF/JH48PG5EthM2Bq8Ekaly6Adx4YfB8BFHnJ0fd2CIMVO9lthZfA+2Y8oZiKbj4H
	 E1njn2n6SGtqtKqfRZyXrNfiPP4tsQ59ev+DVR4EoHuM4WZdsrU+ppN5HXZp02NUGN
	 hOztt8GESOV5A==
Message-ID: <sashiko-outbox-224262@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/11] leds: rgb: ktd202x: Add hardware pattern
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-8-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-8-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:15:57 +0000
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
> The KTD202x and the ET6326 can ramp the LED current up and down on
> their own: the flash timer that already does blink_set also has rise
> and fall times of up to 1.92 s. Without them, a breathing light needs
> the software pattern trigger, which is an I2C write every 50 ms.
>=20
> Implement pattern_set and pattern_clear for the pattern trigger's
> hw_pattern. A pattern is the one breathing cycle the hardware has,
> "0 rise brightness high brightness fall 0 low", which the software
> pattern trigger plays as the same breath, repeated forever.
>=20
> blink_set now clears the ramp times, so a blink after a pattern stays
> sharp.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D8

