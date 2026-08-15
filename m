Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9338A29A;
	Sat, 15 Aug 2026 23:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835515; cv=none; b=qwZAZhAN0tHuEfWL2Qm8btnXZZ+reW7pPPE6JMD/TPqIPAoqZGOL0PT1S5phmHE5PCNaV9UUY+vxKoug+QuHA+Brvp9EBFtME/0MuIGr4MiLfT70tIzOLhVnP9n0ic0myZKb20pHZqTQm7MKWIyD7TJjWIjrnws1aXXF9HyGl6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835515; c=relaxed/simple;
	bh=W+KCJGYlgrSm6n3sPVGnOuiGxImvm5CZsjEhl3eVY64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ITBTyBpfGuOoN7McXy5CCraDLNAeVU2+w046dy9XKJ/HCZHkEHsHXuFQPahBp6kuRo47Kf8A1yottga/EHT2B+bnw5rcRjXK4GcK/bu2htR2y06BNHK5+TMlcTe4T8ka2uYLhHkagWny76Ae7keFB2+SDsZcdtkmnX4MJF1efEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nx2gAzpJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nx2gAzpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4EA1F00A3A;
	Sat, 15 Aug 2026 23:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835514;
	bh=W+KCJGYlgrSm6n3sPVGnOuiGxImvm5CZsjEhl3eVY64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nx2gAzpJvVD+nIS1oyJFHfF2QXWsAfyE2IeOtuwqoazJrXU2TAmakbvBk+M+Tw3ZD
	 3m/gxs9Ta5dHxY99i2nJWacr9psgKBStIsVzU/yoNketPrnmLa9BnvfKIPDfzQZNiX
	 I2XnS0ZzX45BzzP2VlgIykC9AV7J1ESwNeOf03y9qeNL0ZQVNAaQOT9nL5zbS8ymcr
	 pvpwE9zk2LfFaX3QYd2Y1zGylCHyObsYbd6rDpsK4PsohHOUK58WAhZw9NmxaCX9bs
	 MHi7u3VEsWk2nRYZQbpNlKfWYtLVyzgbigc2Z0q3xcx5/rUje0cqEZKiCE8a03Dtcq
	 Topuk1bklwkwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/7] i2c: mux: Propagate software nodes to
 channel adapters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <a758b93f394ecfd4dfa65517782530d4a8c45e39.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <a758b93f394ecfd4dfa65517782530d4a8c45e39.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:53 +0000
Message-Id: <20260815231154.2E4EA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Device Tree channel nodes are associated with the adapters created by
> i2c-mux, but equivalent software-node descriptions are not.
>=20
> Find the software-node child whose reg value matches the channel and
> attach it to the new adapter. Preserve an ACPI primary node when present
> and extend I2C firmware-node adapter lookup to match the attached
> secondary node.
>=20
> Track attachment ownership so failure cleanup cannot detach a
> pre-existing node. Keep the owned node attached through child-client
> removal, then release its reference after adapter deletion.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D3

