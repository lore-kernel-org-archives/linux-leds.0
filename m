Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC53EC2FF;
	Thu,  6 Aug 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048422; cv=none; b=mT2Sw4VvU9oxuyembHSP6rOAzo6wk1LgrY9K1nu/79vOmcZHk8ycWhg8BQVAPoLSzdhoMoqg7rmXJ9h3Tx+HkiGbpkRA0lhlgcMjqgn13wVAZ3fpdN/B/543d3y2ux/jnaWpg1Wan1s3fJRvTouCtDagH8obCvN6Ri96nGGyLRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048422; c=relaxed/simple;
	bh=4NG2UIBW6bwWmVbMIa1q6Az1uhycIM5CpibMhj4L1ys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dEBwKrgvnFm9PqYQHQEBTopzGJhp6x6gEFm38ss6J+vPPKoANqqONHosPDTUIw3DuES88Y9ZMrg4sekDtXxlABTz3O+9BbvpBmSNNOKb2nT3zFpK3VwGB0+PQ8g9Vs1wlzKouCqWxN+XAxHgX2ej+Y/rqebybGSg6jp4B+fC3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z89gFMy6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z89gFMy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F22C1F000E9;
	Thu,  6 Aug 2026 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786048421;
	bh=4NG2UIBW6bwWmVbMIa1q6Az1uhycIM5CpibMhj4L1ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z89gFMy6n7lnb6ys7MheTYZOsQi/XwyRNFwg+BDVctJJZNrg0hwkDetMhlcxn2LBq
	 WyrvvFWVzsrWvdYeMD7rpsm3lDQOv4r/UYk2zJ+/c9C3zTHFkeNlcG444PuyhmOyK2
	 vp3I2E04vYaMcTt9sY8fef74xfnvymBdGWb/KXUscLT/3liWp3EfjfIObyflqMuuK0
	 y8dSyOC+SGlRjIOd93qf0cq5wr0sKycsW/zh6T3mAHK3pEZN6mo8+JUvgkv3tFG1dA
	 YWoEk+GctUFxEF6IR6ldgML4v9d/NIyLLAykJqt+uYfNbSAnfKqrewo9s/wEkeY6Wj
	 BTZdVVa0JinDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: backlight: Add Orient Chip OCP8178
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wim de With" <wf@dewith.io>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260806201541.101304-2-wf@dewith.io>
References: <20260806201541.101304-1-wf@dewith.io>
 <20260806201541.101304-2-wf@dewith.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:33:39 +0000
Message-Id: <20260806203340.3F22C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add device tree bindings for the Orient Chip OCP8178 LED backlight
> driver.
>=20
> Signed-off-by: Wim de With <wf@dewith.io>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806201541.1013=
04-1-wf@dewith.io?part=3D1

