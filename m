Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909A39A7E1;
	Tue, 30 Jun 2026 07:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804252; cv=none; b=FtrN7wFlOo40MzKQEYLme2w9Rj50mpmwr3lYm+HX/+rCBMRnqwP7dq7+9UbkOkn4NVyOccibCD+92jOCRouPcEWa1N2v/8sBhjsqlDj9Ia/l3JAxCMUwWc8Xl1Y2g3u6izaCTzm4ORiU0rGdpYOUh+0Kh8gRMrWaa+sosAiAdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804252; c=relaxed/simple;
	bh=O1MTdSeMChmGuLCFMQLb5LEb1VBQ6GGvYCURhlS9KzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAp3qupriXKSOYeRxbuBcqMzyLXzpkJ7dNfyQNlTLGPOxpHCyWrhKG1lO2FY94/mt/GuHvVUWXi42kXgeHXjbSQOCSD58/RPr3JyP4Ij+dW/CvNjSjLXGG3idAxp9mv3frAMxLXMF1wFhLWc52uBcpUk6HDzPkmzhGV5ROusLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3HSrKWb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3HSrKWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A953E1F000E9;
	Tue, 30 Jun 2026 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804251;
	bh=O1MTdSeMChmGuLCFMQLb5LEb1VBQ6GGvYCURhlS9KzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3HSrKWblIGt6qprwc8g2ASw0aKsz0NorwrMtpIriWgtXQkBnMuGE9/jjOh+eESph
	 P7FPRaDhPTKgxTI4oFhOBUeD2aEE9gK+utxyit6Suc/Ffe+c0fdTYH/Gh+7++bOQzC
	 DrzC1l9eHrxZ58/MAy0wRAWj86qOluGxsRjbmJpooBA/6ARA49VEqIbhqZvO1rcB5G
	 udHf/mBNt41erzIc2CkTq0KR4GS11wEPCX+1UgTZkLyJSHqXKS2TWGY+jWvrLLSvXl
	 NavaIpZTbjTdjD9D+8P49i/ddWwagfW9V6tBcwmXJQDv6Fgz+NgPTAf2FvUV50IGOY
	 enUxGXN0KaKXA==
Date: Tue, 30 Jun 2026 09:24:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Message-ID: <20260630-alluring-gentle-sidewinder-f37696@quoll>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>

On Mon, Jun 29, 2026 at 09:52:07PM +0200, Loic Poulain wrote:
> Add support for grouping individual PCA963x channels into a multicolor
> LED by introducing a multi-led@N node pattern. This follows the

And why do we want it? Here you explain why you do it.

> convention established by other multicolor LED drivers such as
> kinetic,ktd202x.
> ---

Run checkpatch

Best regards,
Krzysztof

