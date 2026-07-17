Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549173F7A94
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 12:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291430; cv=none; b=LLMRp5AWHtL6bdYbmsjvIZE+qzX9Bxb7LbMkKTif0JozAw9v6Nxi4gLq8qc8BCq78u3cVoMj+Ck4qgQj5JgWQSePNpqQOO6BKRtkZWqp6ObOl2O4MdkSStCG8lKyt4zG6P+9zgtMN82/gegT3KXwF7gGWhY3rAQHSrpSYyRmNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291430; c=relaxed/simple;
	bh=1QSHXywn4I6FhGv21LTgB+HqCHPxJwx8a+ayIgPrR1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0rGcJMzK+MC4zJBwQEw5TlQNdJwx77edz96mZrZMREINRz3T6vMrkP1YIYgTC44fSKXrqpZidetfhHPS01sQPsRKy8tk4Hs9CBKmGiF8q02tzWiW1CCDpBsFOljUWrTzRROEFDZuvD9Mn2xdZpZ8wcb9Mrc6Z+UncfEDXFotvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Au0kuC3f; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Au0kuC3f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784291424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QSHXywn4I6FhGv21LTgB+HqCHPxJwx8a+ayIgPrR1E=;
	b=Au0kuC3fj4oAuqSoO8tn7/uoMBJ5LHQLoaq0VnbQjpYZgh89b0kCqMjiKgOGhFeXSkUEd1
	B8SVvdsU7g1NTdvPyYCK0jDN84EJyDuTAAL71gknSh7zqy2ot3/WrSyoq04JqXeMhoyZ6k
	njmTO7+AD1akk8I4+Wfq+YrEyA2UoWM=
From: Junjie Cao <junjie.cao@linux.dev>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com
Subject: Re: [PATCH 1/2] backlight: aw99706: Fix DT property names to match binding
Date: Fri, 17 Jul 2026 05:30:11 -0700
Message-ID: <20260717123011.442600-1-junjie.cao@linux.dev>
In-Reply-To: <20260701133918.33487-1-junjie.cao@linux.dev>
References: <20260701133918.33487-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

Gentle ping on these.

Thanks,
Junjie
