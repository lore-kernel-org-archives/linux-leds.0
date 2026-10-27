Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136479;
	b=w5W/ffHu7zXbdwbzFMs4JPqGBDPsOF+9bRc9xi7sE6D2Wizx+nF+TgFl2by1Imeg9ptT
	 GGtXNyrsHUf71jkpioJYG0oDSCp8alFAU9jDNz7eeIAgP1dyVLXDSmtzPtEtBp9jXI4yh
	 RjvUxxegsRKGCmkBpUmHqp/EqfCiD1+Dbhea3q/3XE62QELF9e1NnOIw9KZtYAuVMqLw4
	 MLSEqmbC/dYu29ZvvXp5sIRP1JTuGsGSdH7Ok/aLL3GpjnWMYb8TNlQEpuqIGqcgWIjFA
	 B2CzkE6J4iCvJft7nRSDQA4w3VD4542A2dJyktVIR4tlwQyUrHutWy6/zBQJN+oo8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136479;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZJHJDX+tYIUA8TS0+Bq9o54ynInCFB+BPhOqtDXik/E=;
	b=Dm7TE83EGiDS/+SG1+s/A+JSB4yzPxamuXmFPC8zhuCj0mShdA2RpeeFbN7QICkQJnOG
	 j/nDZw+qhXVIQuuK1TBok+cXHxadH7YMTOGPDgnTC9GRlM5ljb2dm6qvM3WD+z7TKbQEY
	 JjmcVRlhbTnjl+kiqYToIjOI99CYLemz7mkI9kalFw5AHYuSn8lGzJyF+2W+cjGYb91Pz
	 fImuJDZT0+9VK1LhfLzfE8clBH4VyOkk3Q79I6U4YS2SM6+2O4+h9KQjay74eLNeLCdy7
	 McZBjKyJVWSQJINAbeBZtVOr0GOp8TrVREPRwRgBv0dgWqrVvA8Nvm0BsUPqkrkPVIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEIpHx0R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6434606A31D;
	Tue, 27 Oct 2026 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEIpHx0R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7641F01825;
	Tue, 27 Oct 2026 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793136479;
	bh=ZJHJDX+tYIUA8TS0+Bq9o54ynInCFB+BPhOqtDXik/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEIpHx0RsCRowtnfMbIuCR2D+rIwqgRZBrybqAZ3FFR3/gWyqkvM4PcyYHX5VSNel
	 b1hT62iCJRVS1pne62f6AsUDCQF0Gsf5KJy1/bimkmkNQvtExHykbI7aT9BzJ/lRW0
	 44qF0vRl57Vt1OYfPnQAm3EbKfO++mJdECu+NoS+P+8UHcqVk453FNeR5UMjz+kZzM
	 PDVfwhiKMl0qwgXfzLU1Tp6N4LeeKWUz/0ksmpsx8KuvAG1JvzRBhMbg1z2tffrYJg
	 mgKcNj6xF12tUhLphUUMcF8CxatWM3NSwkfwIkVmn/HARq2b5LKrN5KYcIR3Vavp2O
	 YzBOREJ/YZY3Q==
Date: Tue, 27 Oct 2026 16:27:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees+treewide@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: Document
 AAT1270 Current Regulator for Flash LEDs
Message-ID: <179313647382.1169325.8091091196008624804.robh@kernel.org>
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-2-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013181803.496627-2-clamor95@gmail.com>


On Tue, 13 Oct 2026 21:18:01 +0300, Svyatoslav Ryhel wrote:
> The AAT1270 Current Regulator for Flash LEDs has a similar configuration
> to the AAT1290, but it uses a different programming model and requires a
> separate compatible.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/leds/skyworks,aat1290.yaml       | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

