Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7E38332F;
	Thu,  6 Aug 2026 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024387; cv=none; b=ZkfBUIbSzZkGzpl19Xuv085SMw3gKlSRqXQYsOq3D3HpFjqdYZwavbwTZmJ0Y+i9AnS6BhJn3xZJkyKzDsrfY43rh7aWikqBSXLb4NtC1VMZL5Cep73hmTGPHWxXji22BndNyviG/ev6PItMF0MBeVkXQk3xXdPoM39S5wa/Cjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024387; c=relaxed/simple;
	bh=ukz1yCWoR+k8zzsM91yGt9RVYTtVix5KndKgC8vmrSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbCF9sSW/tvV6CCe7mH/T4ZzHu8JgM21d5Z7/O01gOEbRBPYfn3bBMcGvpNVEVVdcz4t5qkYvnL1rCVxol3HYXtpmMd3wqvbxpJgZ9cerjg56Sv5Y+MEKW/88ArIhV0oS9KF1KnmQYeFMAwiTK+1DzfWvHRXt7VLfnP9HrQI1ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTVmWHzE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTVmWHzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9951F000E9;
	Thu,  6 Aug 2026 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024385;
	bh=+7pk6IceR533hTducYarfM7da6y/ORD6dTjUF+YXTX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTVmWHzE9axoznInELbMD7nvS6rG4UuHa+xPIhcBmsHbP3877Yg7cxNgo9Iuq+oie
	 CE10Oh3yyy/f0LvReYi2f2+yQliEGWqlhUocHRfRq17pecTr9Uwmzbd97MdKJ5H14E
	 pWjxWlLdQxXMWcCA3+ufdactWsMX9fJmCtILFh7lKG4F5Z4X8W7400+H6f3logcyYk
	 V4GklgU5ogQZsIFrPlgP0FvEZQucSwdSlbi4FMICyhG3F9rprvRGtpqNyV93vNnsmi
	 0MOwn6GuKnAoCOy9M3rCWnXbccqSG7U3L1J5Wx+gmioutnlsf23crEBj/8inqFrceG
	 UYnkVUa1TLH0w==
Date: Thu, 6 Aug 2026 14:53:01 +0100
From: Lee Jones <lee@kernel.org>
To: Arunachalam <arun07172003@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] leds: cobalt-raq: Add missing MODULE_DESCRIPTION
Message-ID: <20260806135301.GH2869284@google.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725081349.8556-1-arun07172003@gmail.com>

On Sat, 25 Jul 2026, Arunachalam wrote:

> Add the missing MODULE_DESCRIPTION() macro, which is required by
> modpost and was missing from this driver.
> 
> Signed-off-by: Arunachalam <arun07172003@gmail.com>

This set is un-reviewable.

Please submit both sets again separately.

-- 
Lee Jones
