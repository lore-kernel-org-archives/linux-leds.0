Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA22B42CB0E;
	Mon,  6 Jul 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353242; cv=none; b=tZO93jqgDwdELu5fm+aaGqOFTbwZ3CJjJt6C6kgX+LeD0F+joQc6rHorERhDv04DdfVq5LPdJ5O+qdM+oNKcAXjXia8aKuYhgsQ0cI/7cIs+aPAf7VMzhHvJKfQgXXsTAX/sp5bqUxKzDXP3DhfnEWRBMrPNeQXhIGc5g83cwAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353242; c=relaxed/simple;
	bh=Mv7nxjYQ6BqAIoIBOF+fU1A/fyFoR+yW+jyJnsn2oik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cpZ9PQ5OIRLKKxTKdTOr7NECvwIsW9Q1nrEKMnshMeb2eatqeJMU4SkMjkFm4DjU8lIsm2pOUTI3K820A++EQaSOErZdzbglbcs9hKg341f8B/D7DuOEkZhY1883Vb4GzlrOpktJG37JuEat04BJcCMw9/tKx+rzYNLxsgaB0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxtQqKUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxtQqKUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021DC1F00A3F;
	Mon,  6 Jul 2026 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353241;
	bh=Mv7nxjYQ6BqAIoIBOF+fU1A/fyFoR+yW+jyJnsn2oik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxtQqKUfnlULzYT7m1k0oaEzCMr9Wm5rKDEVDfVhP3DpK0y4aA+sqsecJUzF5K0IE
	 Sxq8BK21rr9wnTM/3bsav0ytF1t3nKxwncsguFwELZDTmfTlacJayFbX5LWvL9p7ff
	 XDaKxxEmyuDlq37iCtApunYIUDqVEyfT/wHuJkRUCH5yRxqlkFGxwSarJiW5msPKwp
	 yfQjcZijo1TwehJDQ4RqstYcFNfR+TvNUwdqhSYC9cIumSdNFTYnr+a1pbzMx+uufR
	 gGfVjud2PEW8rGhEfRoF2G4/KjC8GMp8o8kxJyo/c+61zgicv9xR1JMXw0MuMXzKMf
	 JIj/CeplhgwmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum
 for pca9635
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260706-monza-leds-v3-1-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-1-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:54:00 +0000
Message-Id: <20260706155401.021DC1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pca9635 supports 16 LED channels, unlike the pca9634 which only
> supports 8. The allOf conditional grouped both chips under a single
> else branch capping reg at a maximum of 7.
>=20
> Give pca9634 its own if/then block and let pca9635 fall through the
> else branch with the correct maximum of 15.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D1

