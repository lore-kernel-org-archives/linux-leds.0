Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7564529B200
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967711; cv=none; b=SYubOmxtJxDtEQ4zmwZkJMfdjILs8ADeTLOxUWQ9nCPNkSBOYF82nJd/tgCIyax194LUHEnPsdYM/o78gS+slasGm7XlNdzf4L9aDFJVGtzS/pVoFPYLBjRd+fhfUHTodpsxmxj10/ImDS5cWvf3OoIiRZ7TR9bg5HjwsVR3s70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967711; c=relaxed/simple;
	bh=UScJnYZn12ln3R83My4iQjeALu+Oy37FraN6lLPpd/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u61GlM2PjOed2KhQpNoIQfOFJnRShsPEOiBRdsWKI2UQ8IYk1PzW5oJ4zYMxpiSZhaUo7aIhx17rZwPnndGrUv+uF2ncZGsOEBSuJMftYq1PT09IXc3NskOETm8us4cqf+K7UnShTl/xJssPb/cEnE3QqIgi2y+O0xDhqheuNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLwwfX9C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLwwfX9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A3C1F000E9;
	Sat, 25 Jul 2026 08:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784967710;
	bh=UScJnYZn12ln3R83My4iQjeALu+Oy37FraN6lLPpd/4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLwwfX9CoySa1esUaETIe7iDZaH2WHSpTZ8oPptfKZ5HA7XusHL1KpT1wFDMOoWll
	 MA+VVMMCs0crRRqZrHa1588bWbP+Fg1oFUZ2qqlGzBfu1DaVqdkrTNlJ3jjiNYKNH5
	 NVq1KLfqU4fB6KMblzLW68quPC2Pd5wbzokSvJxrTHawUE+r/PhQanFo3iPXPzdxDc
	 d5ijI9o4xTpu5vOoxW3eK+fFovEDdP5pGIK1g+f7/mmdXXBqV7mhW+wF7kOe9Bkfad
	 1yBPOkEnvKZkrHu0JEhnogjHE6fQ0MGrB68b3nYHDS3wiPGnIIEl7xbrBCBeJG4aqC
	 icj+GdnRvAXtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] leds: lp8788: Convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260725081349.8556-2-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
 <20260725081349.8556-2-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 08:21:49 +0000
Message-Id: <20260725082149.C7A3C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Replace open-coded dev_err() + return patterns with dev_err_probe(),
> which also handles -EPROBE_DEFER correctly.
>=20
> Signed-off-by: Arunachalam <arun07172003@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725081349.8556=
-1-arun07172003@gmail.com?part=3D2

