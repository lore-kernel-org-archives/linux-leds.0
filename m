Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31462F7EE1
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333256; cv=none; b=fWX3d+QnV1FQFCbrqFH2ne4V6gk5dubiGIwnqdEZ0ExIu40xXgsrLn80WZMF028WC3CO/9KxVnQa+mjc/gfWGXI8F9FjnUN6n/nfoU152vfAHsCd7aiS6axJlFr55pIvwqDAtijQ7MC6KU45PMkDHdUcyTa0U08Hs4PqmVAebCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333256; c=relaxed/simple;
	bh=l34qLtsfujXhG5/2gv+PgEhUhTrNo0P5Ap+tM+xt+R8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZsoJmBFOxDUmF3h6z2lciUQEuaCnWSCFVka5k5tJER7BTxUrv+eY+kbRnA5sk8gKdG7UpAFgCRXRn7mE4dQ1D4wjW7PaMrQbKqHC5XZfqxZsn/vllxNP801FaZgcGARjgT8C0MvyqovdEPcx20JJj8ISLPnBUTjLoFONmQBV9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1LBLsJW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1LBLsJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955EC1F00A3D;
	Fri, 21 Aug 2026 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333255;
	bh=l34qLtsfujXhG5/2gv+PgEhUhTrNo0P5Ap+tM+xt+R8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e1LBLsJWwJ82ht5MNTNK1gzgbIpg0Ue+GBpumnFZGOf86G8LaUmC2pQI0sjA26iNa
	 ViKS5pIXbhF6U7vYY6vS5NcGND6ZjciRxGAK/k5IkbsVfuZHsbWgF88rXQBkpMLUfA
	 CUKyVYZ1qii/Ow+GjpyD4MsJtsrpHST3uxsat6rpx7SRrhCC85T4P8myqViixZdfvN
	 BfImqckr79YzK+qPHRGa9q22AZtYvB/9WeMG5cX8rB0FmpcYos83tm61kPenm7GOy8
	 dWn1fdlqMIbpuHWZyQcd6OQ9q4BVwYjrGCr5luzHxkigbodbjceadD4iiC51G1+n18
	 T4OmntAvQ77MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/12] leds: cros_ec: Implement offloaded() trigger
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-4-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-4-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:35 +0000
Message-Id: <20260821172735.955EC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> "chromeos-auto" is a private hardware control trigger which always stays
> in hardware control. Implement offloaded() callback with its return
> value to be always true to reflect this.
>=20
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D4

