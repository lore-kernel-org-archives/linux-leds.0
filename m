Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916484;
	b=eEL+zzOoIgFsk+jxFLwfwM1WE0ZLrniDe+3ylfNZiaZrjLVcdcyuvmre6AJ6wnlrHEI9
	 5+ykI6v7hgu00UKnuPL3gmapVozKNlG+EWAn+knGnyKJFciYFDYfGOfdg8IZMnhNjMcYP
	 hc/fPj8KeuRBTn6QwWDCc9Xm3Lz7mbB83pM4Xa4hvtdEdmD2aRjv1yO/Xb941L4KvYKMa
	 VT3uHowwoGYH+3xcgeVBPuSRSfuYmtauRSn6ZBXj+weD8oDCSRK53wkOaXszUTunSu/YB
	 ayMnc7ie/YdCa6jhEbqqSx9OTTtQ1fv0ozNo7Tr62ovR8NxgVQc1Tyb0PHaUatbzWzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lss1ePYo9p/xM9RukjfdvyCi0ZnMK6Lil9J96em0jBA=;
	b=FPVO+mrkDPORW9WkzHVqLvraU/JKgB1pO0EVQeNrEOcQYO0NKN9tm0frOtJVuZW70cNY
	 /jN6J1n/4bFcTRsVUr3kGEOHyPpBziW7hgL8m+8P+fFDMsYXECkOAHGwhRmOHKGihP7Vy
	 zTstb4MMITIARnEqKHu3MHBtVgGrjTao1n4QOT/C4GSBV3iVFbwp8QvKvb0cU6VXVMGKh
	 JYKwP+GVM9N5k1UEqoP+uXovK4uRZFWW1Tm9NO2SZSBtzdsq9a2z3KBsx8x2B9TbS56Jd
	 pDFwMyD7zuYQC6pRQA4mHw20pnuzgBkbbE0sHMOTl4WqOnnhASlPsRZLm/2Atnrnn8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY6SuauL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734A606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY6SuauL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA01F000C4;
	Tue, 17 Nov 2026 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916483;
	bh=lss1ePYo9p/xM9RukjfdvyCi0ZnMK6Lil9J96em0jBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oY6SuauLGLUE5AdLXqbApMPbjJfaZxnkb2OF7RfizoVwpGIbuUxPfXAS2e5Mq4mbY
	 KWg+mdW0Boq8BbtEqhn1Y5HxU1LXK/PVOdsQm0sVJzNnVK5wHFTBR2n2WlUNp7t2Az
	 RTWy5jcUu1+/LtO9v4GW3cFeX0CdcGlEISwXKqwJIAdyOrC+I0oSuOIy40eio++jIs
	 RDtxld6m7ysYShlmlg0ui4O658y7bM2qKoOkXQ6XXkZ4eqc+kcIDQ3TDB6ZQSCtPPO
	 5Rp7FCYmnl97brLMZnqTpZWTH6iVRy9AZFG2MUZto1mjZzG9Ncw71f+z0rywVhC0u+
	 HG4kkQItnwM6A==
Message-ID: <sashiko-outbox-218738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc
 comments for extended register helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117114432.2794961-2-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-2-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:54:42 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
> incorrectly state that the caller must hold the MDIO bus lock.
>=20
> Remove the misleading sentence from both comments since the functions
> lock MDIO internally by themselves.
>=20
> Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Eth=
ernet PHY driver")
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117114432.2794=
961-1-a.shimko.dev@gmail.com?part=3D1

