Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD2B2737F9
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331823; cv=none; b=HLk0+9b2ZUHbpwk8IKT65ograiqXFxX9SxysZtbsqZB9Udz4+643LhHqShjjqMCYmEHxDsq5SK3VYIqrMoKu+1tqyVGTYmlKcrXY1VL2M0U2fpxmEuxPT0p3aK79iQDOeBv5M0jZXxVO3FAH8klzMvPFiMFB7LFPcZ7dblsQyz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331823; c=relaxed/simple;
	bh=9bw04GHb5gj2xvPCGu67lH/22arXAu55o5IBStpP/Uo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rwDsfe72SoE8KVv2PBOIqHeSZmCNiAly1DhU/+eDSYgIxgPxEwiPXjRj+Z54P86jEAj/1rTiFQpgmGeYgH8Q97H2GKEWNmtqnjnT7GRSBEXSbO3TJNHDoAEgq3xs/l3FSWmkjcwqw039YEVUwaMaRAqKmaW1H/H28NiaiAkJ9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwL8FL24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwL8FL24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0141F000C4;
	Sun, 18 Oct 2026 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792331821;
	bh=9bw04GHb5gj2xvPCGu67lH/22arXAu55o5IBStpP/Uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DwL8FL24OmNXMN0gbb7BpdECzfTEgj2e8wjKp74Jv5uZ3SUqcLG2blbKc8JThB2K+
	 NWtGcpkfKFFrqicOEQ5+w2V9LXfUE0avcNUTNbgZMIphmFLqMxyNISiPQ5h9pkimDo
	 HnbM1X152rVy/V9SpS7UiRge7L8aKPcgGU9LyCfTr/0x8eg6ObJQ0edzXUt0rNXm1M
	 rJzJ8guxVTW0bLU8j4gm6X/ACmKFeAoEnkCASbh55gfWNE3wGlurRXEvPDO6PW6bnZ
	 un1fMG2/C9O+t3v5sByAVRANKG04kFjyZO3P35KrAxKWX7OECwNn66JpEMtWmG6vUM
	 LPFdUcsXX3geA==
Message-ID: <sashiko-outbox-176168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] leds: multicolor: Constify sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-3-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:57:01 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Mark all sysfs attributes as const to ensure that they are placed
> in readonly memory to prevent accidental/malicious modification.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D2

