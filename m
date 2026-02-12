Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764552C0F89;
	Thu, 12 Feb 2026 08:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884926; cv=none; b=S2323wGm/iAngQyOomYhAfNSBF0Sya2YNfRu8o7NGPqGq07rJTW9zk6BuMu4FnIpCadmW/7b+K3+jvMtjT5rN38kQlUrgqfJ6HtUClXffag+c4229N60vGLygbZYSObgS31jvXxRhrCtXeqQAzvwYIif52UVwDpOlOtTmGZPyVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884926; c=relaxed/simple;
	bh=FxicXlT1Tmd+JmHYPWKWPjLW6ELJnQtFmdxvC/JVO2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl4sQ7Jn0L9lsQCJJzCRTjx1453MuDIjhke5wjfmwknae1Fip8FfNK24xeRFdWh8IXllRzL7Hm/gf8ZFy9YtSoLRZTd/83HwFjlochyuwEqwVDeaYhw20fGYS1zC1SeR4xwyH0L2r3jm3+GYrzPSlLlN7ZY/LTRJeabMtP3q/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5fskWeF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5fskWeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2922DC19421;
	Thu, 12 Feb 2026 08:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884926;
	bh=FxicXlT1Tmd+JmHYPWKWPjLW6ELJnQtFmdxvC/JVO2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5fskWeFN7va1zAJHikoeENS49bxi45uwH2sMd1hQDhZ4JvAcR+HmagLwCZe256yJ
	 LcPycq6lOT00k6UvyYhDvSd7+aJMszlcm6kZJXPOyo+UK8ZO2vcFbmrZlK7aP7+SVK
	 uk1aJ3I29wkI3lvgV5A4HewDzroBobHWK33P4VJZOhWwo9peIXZCFrICvSG1BWw3/l
	 9/CpRh3+6+7G6PSyl1lvstPSC2mSQC8uPbc4QSkPzvOmo1+FfQGPFE6zaCxBZoCga0
	 g4QdVZqI8ZW5EWWu79AONM6vEdpatKIhg/pzZJV9m1NjZQmqRJCuekdHREGjZSICDR
	 FkUpCk38hzuTQ==
Date: Thu, 12 Feb 2026 08:28:41 +0000
From: Lee Jones <lee@kernel.org>
To: "Escala, Edelweise" <Edelweise.Escala@analog.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/2] Add Support for LTC3219 18 Channel LED Driver
Message-ID: <20260212082841.GB9065@google.com>
References: <20260126-ltc3220-driver-v5-0-152a30e98ab7@analog.com>
 <DS0PR03MB72285F5F9526B1020188CE3FED60A@DS0PR03MB7228.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS0PR03MB72285F5F9526B1020188CE3FED60A@DS0PR03MB7228.namprd03.prod.outlook.com>

On Thu, 12 Feb 2026, Escala, Edelweise wrote:

> Hi all,
> 
> I’d like to kindly follow up on this patch series.
> Is there any additional feedback or action needed from my side to help move it forward upstream?
> 
> Thank you for your time and consideration.

Yes, probably.

However, the merge-window is currently open which mean maintainers and
reviewers are either concentrating on activities or taking a break.

We'll get around to reviewing your submission soon.

-- 
Lee Jones [李琼斯]
