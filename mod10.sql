/*
 *  mod10.sql
 *
 *  Created by Frode Nordahl on 2005-04-01
 *  Copyright 2008 Frode Nordahl. All rights reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */
declare @data char(6)
declare @len int
declare @sum int
declare @factor int
declare @s int
declare @p int

set @data = '123456'
set @sum = 0
set @factor = 2
set @len = len(@data)

while (@len > 0)
begin
	set @s = cast(substring(@data, @len, 1) as int)
	set @p = @s * @factor

	if (@p >= 10)
	begin
		set @sum = @sum -1
		set @p = @p - 10
	end

	set @sum = @sum - @p
	set @factor = 3 - @factor

	set @len = @len -1
end

set @sum = @sum %10

if (@sum < 0)
begin
	set @sum = @sum + 10
end

print @sum
