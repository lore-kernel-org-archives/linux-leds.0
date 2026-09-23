Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E264457A0;
	Wed, 23 Sep 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176681; cv=none; b=ozgu51uav+/UK9W5r7amM5Pz7CuoyXRigprnlPEy6ctxQepDTLoYTBB7I0MrIKXErChxyiT2zvkb8xiI6C8UK2GpLy0mpPvmh2J+/2bopja9dZqriS5tSgCO6HzAVkGshIAMK84D+h9DPFK0TPNtd26ArEE9Hc4EdScKIsK6uRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176681; c=relaxed/simple;
	bh=AbOPEJ+pT59+pBhyyYfzp/6jJkde90l5MjBJDKL0Xeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gs/Un/Kn/VotDpYGBy1dAuvuXgeXN+AtlOZoNqymxUU439m93rvl0SgtoAaVpb/iDsbdIpFMf7baFtd9nkBOQFaBxUbsi7Hane7oioEysYJC/ZKG1iA4W24lQTwbXd66eLxz/tacaQTaW3SFSvHEEqfT9pbQ1sSz5Om11+2zOKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpxWl0pU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpxWl0pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EF81F00899;
	Wed, 23 Sep 2026 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176680;
	bh=73jic6BUPx7wvIk2MjT6GAtiTBLvSWQyr7Rg+aluBG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mpxWl0pUa+6EjYl23cBk3RzGRfSd6CsCQEZOcgZ1Dc89q1F0EzGIB+TC/iEAe3pvG
	 hHErNw45mPNxxj/Stg9GiM4XItlqjERaEJTBuobS+UQnFLWjCS9PIy5DHoXlCF+ChA
	 F14XCl0yPbte2m0JRI931I2lugSQigzMf1aA5933zE5mp3jqaUcmBJ7UPX7GK9tnPS
	 4tRA1MKBe1DnnHxV7B70MbD4NxKS5xUvtbFpEKCsJKKTFXAYxKesY9SRWYqDIyg8mx
	 lXahFiGlSH3S2qkoTi+CYF6NG3kXoufwkrx8sCcV4JbWA/tbrsg+eoaHzJQQ8yrEiD
	 jwEMdNX55hc4g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Peng Fan <peng.fan@nxp.com>, 
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260918141728.3022983-1-peng.fan@oss.nxp.com>
References: <20260918141728.3022983-1-peng.fan@oss.nxp.com>
Subject: Re: (subset) [PATCH] leds: use assign_bit() where applicable
Message-Id: <179017667801.4158471.5830233584845928790.b4-ty@b4>
Date: Wed, 23 Sep 2026 16:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 18 Sep 2026 22:17:23 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch and manual fixups.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: use assign_bit() where applicable
      commit: 52931e38d7eeb28bacc5e7fef2afddd08baa0ecb

--
Lee Jones [李琼斯]

