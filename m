Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353DB3B27F1;
	Thu, 14 May 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770633; cv=none; b=NmL/5h/k3gbgz4oH4ZyGpmy0nTJKCXEfA1rSeJwxSmhfrDTQ9dRbUc0Zd4INxMG0XIchP393YuByWjXE1x4fnUdKuWOJXS8jYxo/7H+cXAL0Mqi6SGN2DuzlgECTdVCjqZRDdgb/o+h58x/uB52suDtlACBPP8571zb0ROjPrGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770633; c=relaxed/simple;
	bh=qQBYtrvVcZTBA0HuOWamtXwth1DfkhD6QEV7NwDmW1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ttq2mhsIDnj448yOUD56GTpagDB/FffUvUQkXlH/dWPJ66MegjRpgOPo3xhnOXtPakCYecBUm/8Nq15mFJubR1FsUT0Kd57lBNdTlJ1Tco0v7/CYsY1Hj2NR0d3aFwArmqzZ7U5fBNMGEjvKhNc8U08i6GB/EbeLkdeRgob8w+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfjemMFE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfjemMFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EE3C2BCB8;
	Thu, 14 May 2026 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778770632;
	bh=qQBYtrvVcZTBA0HuOWamtXwth1DfkhD6QEV7NwDmW1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mfjemMFEW5cvkQ7fmWGPpj7xXg7w/Lgx2/3YzjGbA8SyCp3+KIQMEsjufs5tKi8x1
	 nvbuBetXJZsNHp3YPUUXW9xfe3WOCyiBSu4/agsurTf+8EGNK3StPrEzbp3k7JhbTC
	 3R0BFEFOlzWxG7hXk4AamCzw19IsBn7cLDD1jvh8NdNWk2jNXAE6V0rtJ9PIoKpZEv
	 ZyC6rXNy469TJpyVxuTwUTlI/CVrEVnwazFiCJXN9WLvKOT6WNEoL53Pf8bK+yM5af
	 AvB8mmnmcYDII37XFsuuoxjU63aLPoX4r5ZRk17YvhJfZf0qEw2yqCEDWFuhkpxLjw
	 SnVxLnt5GglMQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260506064847.37795-2-clamor95@gmail.com>
References: <20260506064847.37795-2-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v6 1/6] dt-bindings: leds: Document TI LM3560
 Synchronous Boost Flash Driver
Message-Id: <177877063037.2804734.14048970735148159072.b4-ty@b4>
Date: Thu, 14 May 2026 15:57:10 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 06 May 2026 09:48:42 +0300, Svyatoslav Ryhel wrote:
> Document TI LM3559 and LM3560 Synchronous Boost Flash Driver used for
> camera flash LEDs.

Applied, thanks!

[1/6] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
      commit: 2470a0dc27d9f98d3767dd03d450588f6bd8c3aa

--
Lee Jones [李琼斯]

