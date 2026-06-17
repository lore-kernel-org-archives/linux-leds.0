Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E43F88B8;
	Wed, 17 Jun 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708700; cv=none; b=hk3MJ5QaI80uCVR9cKnvpCca//1/XJtGWnlmooF2nmwDIqk8Z2j+ZV+FtZjGCbNfQ84R5Fz7KmEegBQGnEZ6aBhNu6fu73wcgI22QK4pH/OBKDP+fKIO6wYFEAMnTnKVdSmAygJ1m6AUv/4eE7Y/TvcwxW6md2y4aYGXml8SKRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708700; c=relaxed/simple;
	bh=LQTDRDmDb5iOqrE1ZZiMlnFaxsDOCEJOsuJ9wk+UT+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHOxCIfwslnpyiSVV53zaImG2fT2djmTH9yHF+J141NLzdd3hCOugQ+beBzJNNu/bmochBDOU52muMoPcwU7r1JcIooItfgRunvD1WE9hbjiR7KyL41XBEq3dh0bKEH3R6tZVEe1hoeRtmJ+yLJEq6SRAk3u7oIbRWIXv1UhGG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrOtrFKs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrOtrFKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197071F000E9;
	Wed, 17 Jun 2026 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708699;
	bh=rmlENM7IwWy83mzqELJUTqiuIvubR40QXddhF98ZZbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrOtrFKsi+OuMV5U5Te57QUDkA7P38S3stoXZR/1Kx+CDQlEFrYH2wq8ujeCwIKR8
	 Zm/1iV9Eehv1Jp9fhbx9lDO90igSiRdgsrRyNYus24fJ33p8hEqZtSRTSew7j5/jWy
	 EUGOese1XSXpcqxCTht1T/sTzeH1lxN8uBUrYoVqLb77vjtpMOMpzLIjmgW1oxZzTK
	 Ucl8zZvgeGOZuKbVS0n0Rxp7pnEwf+ql1suBTt7+eKTs4K6UpQ1rtUMEvUnGArsTH5
	 2wHoYK4QmLMcvst486ByOdAdDorxQ2xF2vRICK+OWjOJAwka36zwkzgAmQWODfndrh
	 5IZP0QqfiYu/A==
Date: Wed, 17 Jun 2026 16:04:55 +0100
From: Lee Jones <lee@kernel.org>
To: Manuel Fombuena <fombuena@outlook.com>
Cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
Message-ID: <20260617150455.GK10056@google.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>

On Fri, 05 Jun 2026, Manuel Fombuena wrote:

> This series fixes several bugs in the LED1202 driver related to hardware
> pattern programming and brightness control. The issues were found during
> testing on a Linksys MX4200v2 router running OpenWrt.

I was going to comment on each patch, but here, take the whole review:

https://sashiko.dev/#/patchset/GV1PR08MB84976729EED25ECB484835A4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com

=:-)

-- 
Lee Jones
