Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F0340B39F;
	Fri, 10 Jul 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682907; cv=none; b=rhnP8VsfzhQDM07SaHn1r2BVsBvAG8/oxnEh2zkDDS4AzKrxqeOO+5bDVvxxa4sm+sVBjHFE3AqJyFuK8X874CoMvPyYXEu1KnzGBqxSVMjH6+3kYK3B9l3z4dNkfhCu8+s0AGf23ZhlVWolWbZnLMIR/mTGnIuTtoo0OwGOfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682907; c=relaxed/simple;
	bh=anwGYWlUhs49zhjSlIBuI2L+xq4LO/mhdTy2WntYYWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKAcu1tUpEo2vleDo0JUjmgEiP2GyRB0pAPsZILryNseJhIsE5XT2iw5oBVOSF0UCwUEm4W/whfrj6o1bp5lUk5cUW3UHVf27LFPBSJShPiJR9iCeKYba19EqMJ6vbF+/upL87hNCM/u3XeVxOivZpR/rlZL1dbPPPzjfH18Qno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A09tL/es; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A09tL/es"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245921F00A3D;
	Fri, 10 Jul 2026 11:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682896;
	bh=anwGYWlUhs49zhjSlIBuI2L+xq4LO/mhdTy2WntYYWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A09tL/esE+lvGPPJcBDmIatFVN2Q8wHChDwx1Qhs7ico1wLqakBNOmeA47etmhQlB
	 OAVj8+OrVoRShn0p5hOPCjMBgoaJsZ7oOSWvfRXRDAmg0OEoVwZS5GR95+/P10FSUn
	 CsiBO6SQvACJWywv2TCQm63OVxtQnWVIJsiL+pmeS3Jkze+fmBAspNi3YWk5sGr2yG
	 lXLjv+C7WLg7xNdep3eqdeZVzHWVxOZek/kvqs++mlUkJ4KIE5KsxqJ7Z/nFHgmXLg
	 EpJUnO6P4WB2G5e976e9TCDP0TCI6UZkTn+OfZfUYxH1Y/FspIRTDb/zKys4MD5Vdc
	 6J6cQx1HEEIbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing bracket
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Ebner" <manuelebner@mailbox.org>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710112529.435341-2-manuelebner@mailbox.org>
References: <20260710112529.435341-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:28:15 +0000
Message-Id: <20260710112816.245921F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add missing '};' to code.
>=20
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710112529.4353=
41-2-manuelebner@mailbox.org?part=3D1

