Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0103128A3;
	Fri,  6 Mar 2026 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804618; cv=none; b=dUBGCZWXllyQZT5IMVHBf9ouajyyySzfxAqpJSOtjQY1mLR50StA54XyFSfYhIsd9xu+q7+jbUzzfX2A4cAKv/Iqxvc1Zt2R8E4Q07KEBAGL1OCjP5MrNJ2/Axb7ONygB9dgftsIDRhZHwVFvXh7JYytqK+Gg+HTcnocNZNF4Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804618; c=relaxed/simple;
	bh=kRVQLzO9NnIqw2iaOw/LcD2p7RnqPCr19M3S3p648x4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bRRd+GrpNG4eNmK9hbyyzu52sAv7bHRBbx7g2WA0XvG8bqqaq151Az4ZGsK+uYqJwGsJBUGkRLKwvLpZcnRiFLNSN5X6AhcHympO12MRoI7LfFG31USeIwZTNCY9QPKwXGVrAFSQ20l/7rFkLAImKmH2Nbom9W0RrHDhcrFZWCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rijeLbMQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rijeLbMQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC0BC4CEF7;
	Fri,  6 Mar 2026 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772804618;
	bh=kRVQLzO9NnIqw2iaOw/LcD2p7RnqPCr19M3S3p648x4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rijeLbMQXcqsrzkwbgFAdmtoa+cBbpU3Rff06BZLfNodkNdsKUz99jxpDxP+I4kX4
	 UFRCumLB2gPcH2Hz+P4PoJTrW1xqr3O4AF9vb5Z3NAlQHK3DM6xtD7glk3MOGzRXIc
	 QhMe2cmsDivk2RMMc8bDWB5W1d/Kn17AVzzTaHNQEzeBvshMcCdosrZ73JQc/JvyY7
	 Rd576K3j+97nXKPOKgdTzUkR5mszrXXjBAR3ZG4L5HOb5tiVLzuBNorNWnQlAzGX5K
	 tpga9q1ConLDPJjgBYtP/V49MhFurFz8FnP7zGODn+FvYVSZoK3qdp9Sv3wsnhnXWQ
	 0HPdIUFvB1hiQ==
From: Lee Jones <lee@kernel.org>
To: pavel@kernel.org, Chen Ni <nichen@iscas.ac.cn>
Cc: lee@kernel.org, brgl@kernel.org, linusw@kernel.org, 
 andy.shevchenko@gmail.com, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260226033048.3715915-1-nichen@iscas.ac.cn>
References: <20260226033048.3715915-1-nichen@iscas.ac.cn>
Subject: Re: (subset) [PATCH] leds: lgm-sso: Remove duplicate assignments
 for priv->mmap
Message-Id: <177280461596.1039398.8549936635023860114.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 13:43:35 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 26 Feb 2026 11:30:48 +0800, Chen Ni wrote:
> Remove duplicate assignments for priv->mmap in intel_sso_led_probe().
> 
> 

Applied, thanks!

[1/1] leds: lgm-sso: Remove duplicate assignments for priv->mmap
      commit: 23b10d1c20f340b11fbd37187a2bb292de0d2a34

--
Lee Jones [李琼斯]

